GCP CloudSQL MySQL Monitors
==============================

How to use this module
----------------------

```
module "datadog-monitors-gcp-cloudsql-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/clouds-sql/mysql?ref={revision}"

  project_id  = "${var.gcp_project_id}"
  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* CloudSQL MySQL Network Connections
* CloudSQL MySQL Replication Lag
* CloudSQL MySQL Failover Lag

Useful links
------------

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
* [Max connections depends on the type of the instance](https://cloud.google.com/sql/docs/quotas#fixed-limits)

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| network_connections_hard_limit | Max number of connections for the CloudSQL Instance. Default value is the max value on https://cloud.google.com/sql/docs/quotas#fixed-limits for MySQL | string | `4000` | no |
| network_connections_message | Custom message for the Network Connections monitor | string | `` | no |
| network_connections_silenced | Groups to mute for GCP Cloud SQL Network Connections monitor | map | `<map>` | no |
| network_connections_threshold_critical | Number of network connections (critical threshold) | string | `3600` | no |
| network_connections_threshold_warning | Number of network connections (warning threshold) | string | `3200` | no |
| network_connections_timeframe | Timeframe for the Network Connections monitor | string | `last_5m` | no |
| project_id | ID of the GCP Project | string | - | yes |
