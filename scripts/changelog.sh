#/bin/bash
set -euo pipefail

source "$(dirname $0)/utils.sh"
goto_root

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

err() {
    rm -fr ${TMP}
    IFS=$SAVEIFS
}
trap 'err $LINENO' ERR TERM EXIT INT

mkdir -p ${HOME}/.jira.d/templates
cat > ${HOME}/.jira.d/templates/changelog <<EOF
{{ .fields.issuetype.name }};{{ .key }};{{if .fields.status -}}{{ .fields.status.name }}{{end -}};{{ .fields.summary }}
EOF

TMP_ISSUES=$TMP/issues.txt
for commit in $(git log $(git describe --tags --abbrev=0)..HEAD --oneline); do
    [[ $commit =~ ^.*(MON-[0-9]+).*$ ]] && echo "${BASH_REMATCH[1]}"
done | sort -u > $TMP_ISSUES

TMP_CHANGELOG=${TMP}/changelog.md
echo -e "\n# $TAG_TARGET ($(LANG=eng date +"%B %d, %Y"))" >> $TMP_CHANGELOG
for issue in $(cat $TMP_ISSUES); do
    IFS=';' read -r type issue status summary < <(jira --endpoint=${JIRA_ENDPOINT} --login=${JIRA_LOGIN} view $issue --template=changelog)
    if [[ "$JIRA_STATUS" == *"$status"* ]]; then
        if ! grep -q "^## $type" $TMP_CHANGELOG; then 
            echo -e "\n## $type\n" >> $TMP_CHANGELOG
        fi
        echo "*   [[$issue](${JIRA_ENDPOINT}/browse/${issue})] - $summary" >> $TMP_CHANGELOG
    else
        echo "Ignore $issue with status \"$status\" not in [$JIRA_STATUS] ($summary)"
    fi
done

cat $TMP_CHANGELOG
read -p 'Add this to CHANGELOG.md ? (y/n): ' -r answer
if [[ "$answer" == "y" ]]; then
    echo -e "$(cat $TMP_CHANGELOG)\n$(cat CHANGELOG.md)" > CHANGELOG.md
fi

