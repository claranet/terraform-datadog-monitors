# CLOUD AWS RDS AURORA MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-rds-aurora-mysql" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//cloud/aws/rds/aurora/mysql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- RDS Aurora Mysql replica lag

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aurora\_replicalag\_enabled | Flag to enable RDS Aurora replica lag monitor | string | `"true"` | no |
| aurora\_replicalag\_extra\_tags | Extra tags for RDS Aurora replica lag monitor | list | `[]` | no |
| aurora\_replicalag\_message | Custom message for RDS Aurora replica lag monitor | string | `""` | no |
| aurora\_replicalag\_silenced | Groups to mute for RDS Aurora replica lag monitor | map | `{}` | no |
| aurora\_replicalag\_threshold\_critical | Aurora replica lag in milliseconds (critical threshold) | string | `"200"` | no |
| aurora\_replicalag\_threshold\_warning | Aurora replica lag in milliseconds (warning threshold) | string | `"100"` | no |
| aurora\_replicalag\_timeframe | Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_aurora\_mysql\_replica\_lag\_id | id for monitor rds_aurora_mysql_replica_lag |

## Related documentation

