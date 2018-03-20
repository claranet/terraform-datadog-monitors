MySQL DataDog monitors
==========================================

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
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Environment | string | - | yes |
| filter_tags | Tags used for custom filtering | string | `*` | no |
| mysql_connection_threshold_critical | Maximum critical acceptable percent of connections | string | `80` | no |
| mysql_connection_threshold_warning | Maximum warning acceptable percent of connections | string | `70` | no |
| mysql_thread_threshold_critical | Maximum critical acceptable percent of threads | string | `500` | no |
| mysql_thread_threshold_warning | Maximum warning acceptable percent of threads | string | `400` | no |
| message | Message sent when a monitor is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)
