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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| replication\_lag\_enabled | Flag to enable GCP Cloud SQL Replication Lag monitor | `string` | `"true"` | no |
| replication\_lag\_extra\_tags | Extra tags for GCP Cloud SQL SQL Replication monitor | `list(string)` | `[]` | no |
| replication\_lag\_message | Custom message for the Replication Lag monitor | `string` | `""` | no |
| replication\_lag\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `20` | no |
| replication\_lag\_threshold\_critical | Seconds behind the master (critical threshold) | `string` | `180` | no |
| replication\_lag\_threshold\_warning | Seconds behind the master (warning threshold) | `string` | `90` | no |
| replication\_lag\_time\_aggregator | Time aggregator for the Replication Lag monitor | `string` | `"min"` | no |
| replication\_lag\_timeframe | Timeframe for the Replication Lag monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| replication\_lag\_id | id for monitor replication\_lag |

## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
* [Max connections depends on the type of the instance](https://cloud.google.com/sql/docs/quotas#fixed-limits)
* [Monitoring Replication Lag](https://cloud.google.com/sql/docs/mysql/high-availability#replication-lag-monitor)
* [Monitoring MySQL Performance Metrics](https://www.datadoghq.com/blog/monitoring-mysql-performance-metrics)
