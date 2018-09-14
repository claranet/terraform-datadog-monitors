AWS RDS Instance DataDog monitors
=================================

How to use this module
----------------------

For a single RDS instance :

```
module "datadog-monitors-aws-rds" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/rds?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

For a RDS Aurora cluster :

```
module "datadog-monitors-aws-rds-aurora" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/rds?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"

  aurora_cluster_type = "mysql" # if Aurora cluster Mysql. Else "postgresql" if Aurora cluster PostgreSQL.
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* CPU High
* Free disk space low (only for single RDS instances)
* Aurora Replica Lag (only for Aurora Cluster Mysql or PostgreSQL)

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aurora_cluster_type | RDS Aurora cluster monitoring.  If empty, single RDS instance monitoring. [available values: `mysql`, `postgresql`] | string | `` | no |
| aurora_replicalag_message | Custom message for RDS Aurora replica lag monitor | string | `` | no |
| aurora_replicalag_silenced | Groups to mute for RDS Aurora replica lag monitor | map | `<map>` | no |
| aurora_replicalag_threshold_critical | Aurora replica lag in milliseconds (critical threshold) | string | `200` | no |
| aurora_replicalag_threshold_warning | Aurora replica lag in milliseconds (warning threshold) | string | `100` | no |
| aurora_replicalag_timeframe | Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cpu_message | Custom message for RDS CPU usage monitor | string | `` | no |
| cpu_silenced | Groups to mute for RDS CPU usage monitor | map | `<map>` | no |
| cpu_threshold_critical | CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_threshold_warning | CPU usage in percent (warning threshold) | string | `80` | no |
| cpu_timeframe | Monitor timeframe for RDS CPU usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| diskspace_message | Custom message for RDS free diskspace monitor | string | `` | no |
| diskspace_silenced | Groups to mute for RDS free diskspace monitor | map | `<map>` | no |
| diskspace_threshold_critical | Disk free space in percent (critical threshold) | string | `10` | no |
| diskspace_threshold_warning | Disk free space in percent (warning threshold) | string | `20` | no |
| diskspace_timeframe | Monitor timeframe for RDS free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_rds/](https://docs.datadoghq.com/integrations/amazon_rds/)

AWS RDS Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/rds-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/rds-metricscollected.html)
