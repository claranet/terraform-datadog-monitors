# NETWORK HTTP DataDog monitors

## How to use this module

```
module "datadog-monitors-network-http" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//network/http?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- HTTP cannot connect
- SSL certificate expiration
- SSL invalid certificate


## Related documentation

- Datadog Documentation https://docs.datadoghq.com/integrations/http_check/