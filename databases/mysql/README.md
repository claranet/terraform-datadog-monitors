MySQL DataDog monitors
======================

How to use this module
----------------------

```
module "datadog-monitors-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//databases/mysql?ref={revision}"

  environment = "${var.environment}"
  message = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* MySQL Connections too high
* MySQL Number of threads too high

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Environment | string | - | yes |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| mysql_connection_threshold_critical | Maximum critical acceptable percent of connections | string | `80` | no |
| mysql_connection_threshold_warning | Maximum warning acceptable percent of connections | string | `70` | no |
| mysql_connection_silenced | Groups to mute mysql connection monitor | map | `<map>` | no |
| mysql_connection_message | Custom message for MySQL connection monitor | string | `` | no |
| mysql_thread_threshold_critical | Maximum critical acceptable number of threads | string | `500` | no |
| mysql_thread_threshold_warning | Maximum warning acceptable number of threads | string | `400` | no |
| mysql_thread_silenced | Groups to mute mysql threads monitor | map | `<map>` | no |
| mysql_thread_message | Custom message for MySQL thread monitor | string | `` | no |
| message | Message sent when a monitor is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)
