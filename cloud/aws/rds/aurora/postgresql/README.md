# CLOUD AWS RDS AURORA POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-rds-aurora-postgresql" {
  source      = "claranet/monitors/datadog//cloud/aws/rds/aurora/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- RDS Aurora PostgreSQL replica lag

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aurora\_replicalag\_enabled | Flag to enable RDS Aurora replica lag monitor | `string` | `"true"` | no |
| aurora\_replicalag\_extra\_tags | Extra tags for RDS Aurora replica lag monitor | `list(string)` | `[]` | no |
| aurora\_replicalag\_message | Custom message for RDS Aurora replica lag monitor | `string` | `""` | no |
| aurora\_replicalag\_threshold\_critical | Aurora replica lag in milliseconds (critical threshold) | `string` | `"200"` | no |
| aurora\_replicalag\_threshold\_warning | Aurora replica lag in milliseconds (warning threshold) | `string` | `"100"` | no |
| aurora\_replicalag\_time\_aggregator | Monitor aggregator for RDS Aurora replica lag [available values: min, max or avg] | `string` | `"min"` | no |
| aurora\_replicalag\_timeframe | Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| rds\_aurora\_postgresql\_replica\_lag\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_aurora\_postgresql\_replica\_lag\_id | id for monitor rds\_aurora\_postgresql\_replica\_lag |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_rds/](https://docs.datadoghq.com/integrations/amazon_rds/)

AWS RDS Instance metrics documentation: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch)
