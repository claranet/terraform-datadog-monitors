# CLOUD AZURE VIRTUAL-MACHINE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-virtual-machine" {
  source      = "claranet/monitors/datadog//cloud/azure/virtual-machine"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Virtual Machine CPU usage
- Virtual Machine credit CPU
- Virtual Machine disk space
- Virtual Machine is unreachable
- Virtual Machine RAM reserved
- Virtual Machine requests failed

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu\_remaining\_rate\_enabled | Flag to enable Virtual Machine CPU remaining monitor | `string` | `"true"` | no |
| cpu\_remaining\_rate\_extra\_tags | Extra tags for Virtual Machine CPU remaining monitor | `list(string)` | `[]` | no |
| cpu\_remaining\_rate\_message | Custom message for Virtual Machine CPU remaining monitor | `string` | `""` | no |
| cpu\_remaining\_rate\_threshold\_critical | Virtual Machine CPU rate limit (critical threshold) | `number` | `15` | no |
| cpu\_remaining\_rate\_threshold\_warning | Virtual Machine CPU rate limit (warning threshold) | `number` | `30` | no |
| cpu\_remaining\_rate\_time\_aggregator | Monitor aggregator for Virtual Machine CPU remaining [available values: min, max, sum or avg] | `string` | `"min"` | no |
| cpu\_remaining\_rate\_timeframe | Monitor timeframe for Virtual Machine CPU remaining [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| cpu\_usage\_enabled | Flag to enable Virtual Machine status monitor | `string` | `"true"` | no |
| cpu\_usage\_extra\_tags | Extra tags for Virtual Machine status monitor | `list(string)` | `[]` | no |
| cpu\_usage\_message | Custom message for Virtual Machine CPU monitor | `string` | `""` | no |
| cpu\_usage\_threshold\_critical | Virtual Machine CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| cpu\_usage\_threshold\_warning | Virtual Machine CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| cpu\_usage\_time\_aggregator | Monitor aggregator for Virtual Machine CPU [available values: min, max or avg] | `string` | `"min"` | no |
| cpu\_usage\_timeframe | Monitor timeframe for Virtual Machine CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| disk\_space\_enabled | Flag to enable Virtual Machine status monitor | `string` | `"true"` | no |
| disk\_space\_extra\_tags | Extra tags for Virtual Machine free disk space monitor | `list(string)` | `[]` | no |
| disk\_space\_message | Custom message for Virtual Machine CPU free disk space monitor | `string` | `""` | no |
| disk\_space\_threshold\_critical | Virtual Machine free disk space in percent (critical threshold) | `string` | `"95"` | no |
| disk\_space\_threshold\_warning | Virtual Machine free disk space in percent (warning threshold) | `string` | `"90"` | no |
| disk\_space\_time\_aggregator | Monitor aggregator for Virtual Machine free disk space [available values: min, max or avg] | `string` | `"max"` | no |
| disk\_space\_timeframe | Monitor timeframe for Virtual Machine free disk space too low [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| ram\_reserved\_enabled | Flag to enable Virtual Machine RAM reserved monitor | `string` | `"true"` | no |
| ram\_reserved\_extra\_tags | Extra tags for Virtual Machine RAM reserved monitor | `list(string)` | `[]` | no |
| ram\_reserved\_message | Custom message for Virtual Machine RAM reserved monitor | `string` | `""` | no |
| ram\_reserved\_threshold\_critical | Virtual Machine RAM reserved limit (critical threshold) | `number` | `95` | no |
| ram\_reserved\_threshold\_warning | Virtual Machine RAM reserved limit (warning threshold) | `number` | `90` | no |
| ram\_reserved\_time\_aggregator | Monitor aggregator for Virtual Machine RAM reserved [available values: min, max, sum or avg] | `string` | `"min"` | no |
| ram\_reserved\_timeframe | Monitor timeframe for Virtual Machine RAM reserved [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| requests\_failed\_enabled | Flag to enable Virtual Machine requests failed monitor | `string` | `"true"` | no |
| requests\_failed\_extra\_tags | Extra tags for Virtual Machine requests failed monitor | `list(string)` | `[]` | no |
| requests\_failed\_message | Custom message for Virtual Machine requests failed monitor | `string` | `""` | no |
| requests\_failed\_threshold\_critical | Virtual Machine requests failed limit (critical threshold) | `number` | `95` | no |
| requests\_failed\_threshold\_warning | Virtual Machine requests failed limit (warning threshold) | `number` | `90` | no |
| requests\_failed\_time\_aggregator | Monitor aggregator for Virtual Machine requests failed [available values: min, max, sum or avg] | `string` | `"min"` | no |
| requests\_failed\_timeframe | Monitor timeframe for Virtual Machine requests failed [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| status\_enabled | Flag to enable Virtual Machine status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Virtual Machine status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Virtual Machine status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Virtual Machine status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Virtual Machine status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| virtualmachine\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| virtualmachine\_cpu\_usage\_id | id for monitor virtualmachine\_cpu\_usage |
| virtualmachine\_credit\_cpu\_remaining\_too\_low\_id | id for monitor virtualmachine\_credit\_cpu\_remaining\_too\_low |
| virtualmachine\_disk\_space\_id | id for monitor virtualmachine\_disk\_space |
| virtualmachine\_ram\_reserved\_id | id for monitor virtualmachine\_ram\_reserved |
| virtualmachine\_requests\_failed\_id | id for monitor virtualmachine\_requests\_failed |
| virtualmachine\_status\_id | id for monitor virtualmachine\_status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_vm/](https://docs.datadoghq.com/integrations/azure_vm/)
