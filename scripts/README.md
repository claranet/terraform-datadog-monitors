# Datadog scripts

## Summary

This repository contains a `scripts` directory where there are multiple scripts helping to different things:

- help and automate for some boring and repetitive tasks.
- keep everything up to date and warn if you forget.
- compliant checks and ensure best practices are respected.
- code validation for continuous integration.

## Structure

There are two kinds of scripts naming:

- `[0-9][0-9]_script_name.sh`: will be automatically run by `auto_update.sh` wrapper.
- `script_name.sh`: should be run manually.

Here is a list of scripts and their purpose:

- `auto_update.sh`: is the most important and the one the must used. It is a simple wrapper which will calls every other `[0-9][0-9]*` scripts. 
  - It should be run by contributor after every change.
  - The CI will also run it and it will fail if it detects any change compared to commit.
  - "Children" scripts could be run individually if you know exactly what you need to update after a change.
  - This script all "children" scripts takes one optional parameter to limit execution to a specific sub path. Else this will run on all directories.
- `00_requirements.sh`: check some requirements like `terraform` command exists before run other scripts.
- `10_update_output.sh`: will generate and update all `outputs.tf`.
- `20_update_global_readme.sh`: will update the main `README.md` file and generate the list of all modules browsing the repository.
- `20_update_modules_readmes.sh`: will create and update `README.md` for each module. It will save all manual changes below `## Related documentation` section.
- `30_update_module.sh`: will create `modules.tf` file per module when does not exist.
- `90_best_practices.sh`: will check compliance and best practices respect.
- `99_terraform.sh`: terraform CI (init & validate only while auto apply is done in another pipeline).
- `utils.sh`: contains useful functions common to multiple scripts. It is not attended to be run.
- `changelog.sh`: helper script to release a new version.
  - generate and update `CHANGELOG.md` file from git history.
  - filter to list only "done" issues from JIRA.
  - close all issues on JIRA.
  - fix version for all issues on JIRA.
  - create release for current version on JIRA.

## Usage

After any change on this repo, you need to run the `./scripts/auto_update.sh [PATH_TO_MODULE]` command to make sure all is up to date otherwise the CI pipeline will fail:

The parameter is optional and it will limit the scripts execution on a specific path on the repository

On linux system it is possible to run the script directly while `terraform`, `terraform-docs`, `terraform-config-inspect`, `jq` commands are available in your PATH.
Else you can use [the same docker image as the CI](https://hub.docker.com/r/claranet/datadog-terraform) on every other platforms

With this command run from the root of the repository you will get exactly the same execution as the pipeline (and so the same result also):

```
$ docker run --rm -v "$PWD:/work" claranet/datadog-terraform /work/scripts/auto_update.sh
```
