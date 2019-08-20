# SAAS NEW-RELIC DataDog monitors

## How to use this module

```
module "datadog-monitors-saas-new-relic" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//saas/new-relic?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- New Relic Apdex score ratio
- New Relic application has no-data
- New Relic Error rate

Usage:
    terraform-docs [--no-required] [json | md | markdown] <path>...
    terraform-docs -h | --help
    
## Related documentation

Datadog Documentation https://docs.datadoghq.com/integrations/new_relic/