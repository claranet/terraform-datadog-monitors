# CLOUD GCP CLOUD-SQL MYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-cloud-sql-mysql" {
  source      = "claranet/monitors/datadog//cloud/gcp/cloud-sql/mysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cloud SQL MySQL Replication Lag

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.replication_lag](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_replication_lag_enabled"></a> [replication\_lag\_enabled](#input\_replication\_lag\_enabled) | Flag to enable GCP Cloud SQL Replication Lag monitor | `string` | `"true"` | no |
| <a name="input_replication_lag_extra_tags"></a> [replication\_lag\_extra\_tags](#input\_replication\_lag\_extra\_tags) | Extra tags for GCP Cloud SQL SQL Replication monitor | `list(string)` | `[]` | no |
| <a name="input_replication_lag_message"></a> [replication\_lag\_message](#input\_replication\_lag\_message) | Custom message for the Replication Lag monitor | `string` | `""` | no |
| <a name="input_replication_lag_no_data_timeframe"></a> [replication\_lag\_no\_data\_timeframe](#input\_replication\_lag\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `20` | no |
| <a name="input_replication_lag_threshold_critical"></a> [replication\_lag\_threshold\_critical](#input\_replication\_lag\_threshold\_critical) | Seconds behind the master (critical threshold) | `string` | `180` | no |
| <a name="input_replication_lag_threshold_warning"></a> [replication\_lag\_threshold\_warning](#input\_replication\_lag\_threshold\_warning) | Seconds behind the master (warning threshold) | `string` | `90` | no |
| <a name="input_replication_lag_time_aggregator"></a> [replication\_lag\_time\_aggregator](#input\_replication\_lag\_time\_aggregator) | Time aggregator for the Replication Lag monitor | `string` | `"min"` | no |
| <a name="input_replication_lag_timeframe"></a> [replication\_lag\_timeframe](#input\_replication\_lag\_timeframe) | Timeframe for the Replication Lag monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_replication_lag_id"></a> [replication\_lag\_id](#output\_replication\_lag\_id) | id for monitor replication\_lag |
<!-- END_TF_DOCS -->
## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
* [Max connections depends on the type of the instance](https://cloud.google.com/sql/docs/quotas#fixed-limits)
* [Monitoring Replication Lag](https://cloud.google.com/sql/docs/mysql/high-availability#replication-lag-monitor)
* [Monitoring MySQL Performance Metrics](https://www.datadoghq.com/blog/monitoring-mysql-performance-metrics)
