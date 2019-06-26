# CLOUD AZURE LOAD-BALANCER DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-load-balancer" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/load-balancer?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Load Balancer is unreachable

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| status\_enabled | Flag to enable Load Balancer status monitor | string | `"true"` | no |
| status\_extra\_tags | Extra tags for Load Balancer status monitor | list | `[]` | no |
| status\_message | Custom message for Load Balancer status monitor | string | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Load Balancer status [available values: min, max or avg] | string | `"max"` | no |
| status\_timeframe | Monitor timeframe for Load Balancer status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| loadbalancer\_status\_id | id for monitor loadbalancer_status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20](https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20)
