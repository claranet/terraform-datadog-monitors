# MIDDLEWARE KONG DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-kong" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//middleware/kong?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kong does not respond
- Kong exceeded its treatment limit


## Related documentation

Datadog Documentation https://docs.datadoghq.com/integrations/kong/

