# DATABASE POSTGRESQL DataDog monitors

## How to use this module

```
module "datadog-monitors-database-postgresql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//database/postgresql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- PostgreSQL Connections
- PostgreSQL too many locks

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the metric evaluation | string | `300` | no |
| posgresql_lock_silenced | Groups to mute for PostgreSQL lock monitor | map | `<map>` | no |
| postgresql_connection_enabled | Flag to enable PostgreSQL connection monitor | string | `true` | no |
| postgresql_connection_extra_tags | Extra tags for PostgreSQL connection connects monitor | list | `<list>` | no |
| postgresql_connection_message | Custom message for PostgreSQL connection monitor | string | `` | no |
| postgresql_connection_silenced | Groups to mute for PostgreSQL connection monitor | map | `<map>` | no |
| postgresql_connection_threshold_critical | Maximum critical acceptable percent of connections | string | `80` | no |
| postgresql_connection_threshold_warning | Maximum warning acceptable percent of connections | string | `70` | no |
| postgresql_connection_time_aggregator | Monitor time aggregator for PostgreSQL connection monitor [available values: min, max or avg] | string | `avg` | no |
| postgresql_connection_timeframe | Monitor timeframe for PostgreSQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| postgresql_lock_enabled | Flag to enable PostgreSQL lock monitor | string | `true` | no |
| postgresql_lock_extra_tags | Extra tags for PostgreSQL lock connects monitor | list | `<list>` | no |
| postgresql_lock_message | Custom message for PostgreSQL lock monitor | string | `` | no |
| postgresql_lock_threshold_critical | Maximum critical acceptable number of locks | string | `99` | no |
| postgresql_lock_threshold_warning | Maximum warning acceptable number of locks | string | `70` | no |
| postgresql_lock_time_aggregator | Monitor time aggregator for PostgreSQL lock monitor [available values: min, max or avg] | string | `min` | no |
| postgresql_lock_timeframe | Monitor timeframe for PostgreSQL lock monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| postgresql_connection_too_high_id | id for monitor postgresql_connection_too_high |
| postgresql_too_many_locks_id | id for monitor postgresql_too_many_locks |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/postgres/](https://docs.datadoghq.com/integrations/postgres/)
