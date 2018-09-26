# CLOUD AWS RDS AURORA POSTGRESQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-rds-aurora-postgresql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/rds/aurora/postgresql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- RDS Aurora PostgreSQL replica lag

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aurora_replicalag_enabled | Flag to enable RDS Aurora replica lag monitor | string | `true` | no |
| aurora_replicalag_extra_tags | Extra tags for RDS Aurora replica lag monitor | list | `[]` | no |
| aurora_replicalag_message | Custom message for RDS Aurora replica lag monitor | string | `` | no |
| aurora_replicalag_silenced | Groups to mute for RDS Aurora replica lag monitor | map | `{}` | no |
| aurora_replicalag_threshold_critical | Aurora replica lag in milliseconds (critical threshold) | string | `200` | no |
| aurora_replicalag_threshold_warning | Aurora replica lag in milliseconds (warning threshold) | string | `100` | no |
| aurora_replicalag_timeframe | Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds_aurora_postgresql_replica_lag_id | id for monitor rds_aurora_postgresql_replica_lag |

## Related documentation

