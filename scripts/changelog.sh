#/bin/bash
set -euo pipefail

source "$(dirname $0)/utils.sh"
goto_root

## Check parameters and environment variables
# PARAMETER: The next version to release (i.e. v3.0.0)
# JIRA_API_TOKEN: the user api token to login jira
# JIRA_LOGIN: the user email to login on jira

if [ $# -eq 0 ]; then
    echo "Target tag is required as parameter"
    exit 1
fi

if [ -z ${JIRA_API_TOKEN:-} ]; then
    echo "Environment variable JIRA_API_TOKEN needs to be defined: https://confluence.atlassian.com/cloud/api-tokens-938839638.html"
    exit 2
fi

if [ -z ${JIRA_LOGIN:-} ]; then
    echo "Environment variable JIRA_LOGIN needs to be defined: jira user email"
    exit 3
fi

if ! command -v jira >/dev/null; then
    echo "go-jira command is required: https://github.com/go-jira/jira#install"
fi

TAG_TARGET=$1
TAG_SOURCE=${TAG_SOURCE:-$(git describe --tags --abbrev=0)}
JIRA_ENDPOINT=${JIRA_ENDPOINT:-https://claranet-morea.atlassian.net}
JIRA_STATUS=${JIRA_STATUS:-Done Closed}
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
TMP=$(mktemp -d)

# Clean when exit
err() {
    rm -fr ${TMP}
    IFS=$SAVEIFS
}
trap 'err $LINENO' ERR TERM EXIT INT

# Create the go-jira template with issue, status and summary as CSV
mkdir -p ${HOME}/.jira.d/templates
cat > ${HOME}/.jira.d/templates/changelog <<EOF
{{ .fields.issuetype.name }};{{ .key }};{{if .fields.status -}}{{ .fields.status.name }}{{end -}};{{ .fields.summary }}
EOF
# Create the go-jira template to list allowed versions
cat > ${HOME}/.jira.d/templates/versions <<EOF
{{ range .fields.fixVersions.allowedValues }}{{.name}}
{{end}}
EOF
# Create the go-jira template to edit issue fixing version
cp -f ${HOME}/.jira.d/templates/edit ${HOME}/.jira.d/templates/fixversion
cat >> ${HOME}/.jira.d/templates/fixversion <<EOF
{{if .meta.fields.fixVersions -}}
  {{if .meta.fields.fixVersions.allowedValues}}
  fixVersions: # Values: {{ range .meta.fields.fixVersions.allowedValues }}{{.name}}, {{end}}{{if .overrides.fixVersions}}{{ range (split "," .overrides.fixVersions)}}
    - name: {{.}}{{end}}{{else}}{{range .fields.fixVersions}}
    - name: {{.name}}{{end}}{{end}}
  {{- end -}}
{{- end -}}
EOF

# List all issues in commits from previous tag
TMP_ISSUES=$TMP/issues.txt
for commit in $(git log $(git describe --tags --abbrev=0)..HEAD --oneline); do
    [[ $commit =~ ^.*(MON-[0-9]+).*$ ]] && echo "${BASH_REMATCH[1]}"
done | sort -u > $TMP_ISSUES

TMP_CHANGELOG=${TMP}/changelog.md
TMP_ALLOWED_ISSUES=${TMP}/allowed-issues.txt
# init changelog for next version
echo -e "\n# $TAG_TARGET ($(LANG=eng date +"%B %d, %Y"))" >> $TMP_CHANGELOG
for issue in $(cat $TMP_ISSUES); do
    # retrieve jira information from go-jira template
    IFS=';' read -r type issue status summary < <(jira --endpoint=${JIRA_ENDPOINT} --login=${JIRA_LOGIN} view $issue --template=changelog)
    # Ignore if issue is not in required status
    if [[ "$JIRA_STATUS" == *"$status"* ]]; then
        # add line for type only once
        if ! grep -q "^## $type" $TMP_CHANGELOG; then 
            echo -e "\n## $type\n" >> $TMP_CHANGELOG
        fi
        # add jira issue line to changelog
        echo "*   [[$issue](${JIRA_ENDPOINT}/browse/${issue})] - $summary" >> $TMP_CHANGELOG
        echo $issue >> $TMP_ALLOWED_ISSUES
    else
        echo "Ignore $issue with status \"$status\" not in [$JIRA_STATUS] ($summary)"
    fi
done

cat $TMP_CHANGELOG
# Ask for confirmation to update changelog
read -p 'Update CHANGELOG.md with this ? (y/n): ' -r answer
if [[ "$answer" == "y" ]]; then
    separator='\n'
    # Remove target tag changelog if already exist
    if grep -q $TAG_TARGET CHANGELOG.md; then
        prev_tag=$(grep '^# v' CHANGELOG.md | sed -n 2p)
        sed -i "/${prev_tag}/,\$!d" CHANGELOG.md
        separator="${separator}\n"
    fi
    # Add target tag changelog to final changelog
    echo -e "$(cat $TMP_CHANGELOG)${separator}$(cat CHANGELOG.md)" > CHANGELOG.md
fi

read -p "Close all issues and fix version $TAG_TARGET ? (y/n): " -r answer
if [[ "$answer" == "y" ]]; then
    # Create version if does not exists
    one_issue=$(head -n 1 $TMP_ALLOWED_ISSUES)
    auth_header=$(printf "${JIRA_LOGIN}:${JIRA_API_TOKEN}" | base64)
    if ! jira --endpoint=${JIRA_ENDPOINT} --login=${JIRA_LOGIN} editmeta $one_issue --template=versions | grep -q $TAG_TARGET; then
        curl -H "Authorization: Basic $auth_header" -H "Content-Type: application/json" -X POST -d "{\"name\": \"${TAG_TARGET}\",\"userReleaseDate\": \"$(echo -n $(LANG=eng date +'%-d/%b/%Y'))\",\"project\": \"$(echo -n $one_issue | cut -d'-' -f1)\",\"archived\": false,\"released\": true}" ${JIRA_ENDPOINT}/rest/api/latest/version
    fi
    for issue in $(cat $TMP_ALLOWED_ISSUES); do
        jira --endpoint=${JIRA_ENDPOINT} --login=${JIRA_LOGIN} transition Close $issue
        jira --endpoint=${JIRA_ENDPOINT} --login=${JIRA_LOGIN} edit $issue --template=fixversion --override fixVersions=${TAG_TARGET} --noedit
    done
fi
