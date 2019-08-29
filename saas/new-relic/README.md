# NEW-RELIC DataDog monitors

## How to use this module

```
module "datadog-monitors-new-relic" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//new-relic?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- New Relic Apdex score ratio
- New Relic application has no-data
- New Relic Error rate


## Related documentation

* [Datadog New Relic integration](https://docs.datadoghq.com/integrations/new_relic/)


