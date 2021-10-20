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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.rds_aurora_postgresql_replica_lag](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aurora_replicalag_enabled"></a> [aurora\_replicalag\_enabled](#input\_aurora\_replicalag\_enabled) | Flag to enable RDS Aurora replica lag monitor | `string` | `"true"` | no |
| <a name="input_aurora_replicalag_extra_tags"></a> [aurora\_replicalag\_extra\_tags](#input\_aurora\_replicalag\_extra\_tags) | Extra tags for RDS Aurora replica lag monitor | `list(string)` | `[]` | no |
| <a name="input_aurora_replicalag_message"></a> [aurora\_replicalag\_message](#input\_aurora\_replicalag\_message) | Custom message for RDS Aurora replica lag monitor | `string` | `""` | no |
| <a name="input_aurora_replicalag_threshold_critical"></a> [aurora\_replicalag\_threshold\_critical](#input\_aurora\_replicalag\_threshold\_critical) | Aurora replica lag in milliseconds (critical threshold) | `string` | `"200"` | no |
| <a name="input_aurora_replicalag_threshold_warning"></a> [aurora\_replicalag\_threshold\_warning](#input\_aurora\_replicalag\_threshold\_warning) | Aurora replica lag in milliseconds (warning threshold) | `string` | `"100"` | no |
| <a name="input_aurora_replicalag_time_aggregator"></a> [aurora\_replicalag\_time\_aggregator](#input\_aurora\_replicalag\_time\_aggregator) | Monitor aggregator for RDS Aurora replica lag [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_aurora_replicalag_timeframe"></a> [aurora\_replicalag\_timeframe](#input\_aurora\_replicalag\_timeframe) | Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_rds_aurora_postgresql_replica_lag_no_data_timeframe"></a> [rds\_aurora\_postgresql\_replica\_lag\_no\_data\_timeframe](#input\_rds\_aurora\_postgresql\_replica\_lag\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_aurora_postgresql_replica_lag_id"></a> [rds\_aurora\_postgresql\_replica\_lag\_id](#output\_rds\_aurora\_postgresql\_replica\_lag\_id) | id for monitor rds\_aurora\_postgresql\_replica\_lag |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_rds/](https://docs.datadoghq.com/integrations/amazon_rds/)

AWS RDS Instance metrics documentation: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch)
