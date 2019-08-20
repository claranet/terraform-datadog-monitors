# CAAS DOCKER DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-docker" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//caas/docker?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Docker Container Memory Used (disabled by default)
- Service Docker does not respond


