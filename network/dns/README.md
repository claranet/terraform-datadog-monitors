# NETWORK DNS DataDog monitors

## How to use this module

```
module "datadog-monitors-network-dns" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//network/dns?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DNS cannot resolve


## Related documentation

- Datadog Documentation https://docs.datadoghq.com/integrations/dns_check/
