# CLOUD AZURE VIRTUAL-MACHINE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-virtual-machine" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/virtual-machine?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Virtual Machine CPU usage
- Virtual Machine credit CPU
- Virtual Machine is unreachable
- Virtual Machine RAM reserved

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_remaining\_rate\_enabled | Flag to enable Virtual Machine CPU remaining monitor | string | `"true"` | no |
| cpu\_remaining\_rate\_extra\_tags | Extra tags for Virtual Machine CPU remaining monitor | list(string) | `[]` | no |
| cpu\_remaining\_rate\_message | Custom message for Virtual Machine CPU remaining monitor | string | `""` | no |
| cpu\_remaining\_rate\_threshold\_critical | Virtual Machine CPU rate limit (critical threshold) | string | `"15"` | no |
| cpu\_remaining\_rate\_threshold\_warning | Virtual Machine CPU rate limit (warning threshold) | string | `"30"` | no |
| cpu\_remaining\_rate\_time\_aggregator | Monitor aggregator for Virtual Machine CPU remaining [available values: min, max, sum or avg] | string | `"min"` | no |
| cpu\_remaining\_rate\_timeframe | Monitor timeframe for Virtual Machine CPU remaining [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| cpu\_usage\_enabled | Flag to enable Virtual Machine status monitor | string | `"true"` | no |
| cpu\_usage\_extra\_tags | Extra tags for Virtual Machine status monitor | list(string) | `[]` | no |
| cpu\_usage\_message | Custom message for Virtual Machine CPU monitor | string | `""` | no |
| cpu\_usage\_threshold\_critical | Virtual Machine CPU usage in percent (critical threshold) | string | `"90"` | no |
| cpu\_usage\_threshold\_warning | Virtual Machine CPU usage in percent (warning threshold) | string | `"80"` | no |
| cpu\_usage\_time\_aggregator | Monitor aggregator for Virtual Machine CPU [available values: min, max or avg] | string | `"min"` | no |
| cpu\_usage\_timeframe | Monitor timeframe for Virtual Machine CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a Redis monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| ram\_reserved\_enabled | Flag to enable Virtual Machine RAM reserved monitor | string | `"true"` | no |
| ram\_reserved\_extra\_tags | Extra tags for Virtual Machine RAM reserved monitor | list(string) | `[]` | no |
| ram\_reserved\_message | Custom message for Virtual Machine RAM reserved monitor | string | `""` | no |
| ram\_reserved\_threshold\_critical | Virtual Machine RAM reserved limit (critical threshold) | string | `"95"` | no |
| ram\_reserved\_threshold\_warning | Virtual Machine RAM reserved limit (warning threshold) | string | `"90"` | no |
| ram\_reserved\_time\_aggregator | Monitor aggregator for Virtual Machine RAM reserved [available values: min, max, sum or avg] | string | `"min"` | no |
| ram\_reserved\_timeframe | Monitor timeframe for Virtual Machine RAM reserved [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| status\_enabled | Flag to enable Virtual Machine status monitor | string | `"true"` | no |
| status\_extra\_tags | Extra tags for Virtual Machine status monitor | list(string) | `[]` | no |
| status\_message | Custom message for Virtual Machine status monitor | string | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Virtual Machine status [available values: min, max or avg] | string | `"max"` | no |
| status\_timeframe | Monitor timeframe for Virtual Machine status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| virtualmachine\_cpu\_usage\_id | id for monitor virtualmachine_cpu_usage |
| virtualmachine\_credit\_cpu\_remaining\_too\_low\_id | id for monitor virtualmachine_credit_cpu_remaining_too_low |
| virtualmachine\_ram\_reserved\_id | id for monitor virtualmachine_ram_reserved |
| virtualmachine\_status\_id | id for monitor virtualmachine_status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_vm/](https://docs.datadoghq.com/integrations/azure_vm/)
