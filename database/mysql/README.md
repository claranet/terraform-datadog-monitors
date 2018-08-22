# DATABASE MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-database-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//database/mysql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Connections
- Mysql threads

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| mysql_connection_extra_tags | Extra tags for MySQL connection monitor | list | `<list>` | no |
| mysql_connection_message | Custom message for MySQL connection monitor | string | `` | no |
| mysql_connection_silenced | Groups to mute mysql connection monitor | map | `<map>` | no |
| mysql_connection_threshold_critical | Maximum critical acceptable percent of connections | string | `80` | no |
| mysql_connection_threshold_warning | Maximum warning acceptable percent of connections | string | `70` | no |
| mysql_thread_extra_tags | Extra tags for MySQL thread monitor | list | `<list>` | no |
| mysql_thread_message | Custom message for MySQL thread monitor | string | `` | no |
| mysql_thread_silenced | Groups to mute mysql threads monitor | map | `<map>` | no |
| mysql_thread_threshold_critical | Maximum critical acceptable number of threads | string | `500` | no |
| mysql_thread_threshold_warning | Maximum warning acceptable number of threads | string | `400` | no |
| new_host_delay | Delay in seconds for the metric evaluation | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| mysql_connection_too_high_id | id for monitor mysql_connection_too_high |
| mysql_thread_too_high_id | id for monitor mysql_thread_too_high |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)
