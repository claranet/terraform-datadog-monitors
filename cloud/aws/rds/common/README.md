# CLOUD AWS RDS COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-rds-common" {
  source      = "claranet/monitors/datadog//cloud/aws/rds/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- RDS instance CPU high
- RDS instance free space
- RDS replica lag

## Requirements

No requirements.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu\_enabled | Flag to enable RDS CPU usage monitor | `string` | `"true"` | no |
| cpu\_extra\_tags | Extra tags for RDS CPU usage monitor | `list(string)` | `[]` | no |
| cpu\_message | Custom message for RDS CPU usage monitor | `string` | `""` | no |
| cpu\_threshold\_critical | CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| cpu\_threshold\_warning | CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| cpu\_time\_aggregator | Monitor aggregator for RDS CPU usage [available values: min, max or avg] | `string` | `"min"` | no |
| cpu\_timeframe | Monitor timeframe for RDS CPU usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| diskspace\_enabled | Flag to enable RDS free diskspace monitor | `string` | `"true"` | no |
| diskspace\_extra\_tags | Extra tags for RDS free diskspace monitor | `list(string)` | `[]` | no |
| diskspace\_message | Custom message for RDS free diskspace monitor | `string` | `""` | no |
| diskspace\_threshold\_critical | Disk free space in percent (critical threshold) | `string` | `"10"` | no |
| diskspace\_threshold\_warning | Disk free space in percent (warning threshold) | `string` | `"20"` | no |
| diskspace\_time\_aggregator | Monitor aggregator for RDS free diskspace [available values: min, max or avg] | `string` | `"min"` | no |
| diskspace\_timeframe | Monitor timeframe for RDS free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| rds\_free\_space\_low\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `30` | no |
| replicalag\_enabled | Flag to enable RDS replica lag monitor | `string` | `"true"` | no |
| replicalag\_extra\_tags | Extra tags for RDS replica lag monitor | `list(string)` | `[]` | no |
| replicalag\_message | Custom message for RDS replica lag monitor | `string` | `""` | no |
| replicalag\_threshold\_critical | replica lag in seconds (critical threshold) | `string` | `"300"` | no |
| replicalag\_threshold\_warning | replica lag in seconds (warning threshold) | `string` | `"200"` | no |
| replicalag\_time\_aggregator | Monitor aggregator for RDS replica lag [available values: min, max or avg] | `string` | `"min"` | no |
| replicalag\_timeframe | Monitor timeframe for RDS replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_cpu\_90\_15min\_id | id for monitor rds\_cpu\_90\_15min |
| rds\_free\_space\_low\_id | id for monitor rds\_free\_space\_low |
| rds\_replica\_lag\_id | id for monitor rds\_replica\_lag |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_rds/](https://docs.datadoghq.com/integrations/amazon_rds/)

AWS RDS Instance metrics documentation: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch)
