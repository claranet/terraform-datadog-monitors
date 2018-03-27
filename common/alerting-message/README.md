Alerting Message Datadog Generator
==================================

How to use this module
----------------------

```
module "datadog-message-alerting" {
  source            = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//common/alerting-message?ref={revision}"

  oncall_alert      = "${var.message_alert}"
  oncall_warning    = "${var.message_warning}"
  oncall_nodata     = "${var.message_nodata}"
}
```

Purpose
-------

Creates a DataDog monitor alert message with the following inputs :

* PagerDuty NBH service name
* PagerDuty BH service name
* Prepend test free string
* Append text free string

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| append_text | Optional free text string to append to alert | string | `` | no |
| oncall_alert | Define a broadcast channel for critical alerts | string | - | yes |
| oncall_nodata | Define a broadcast channel for nodata alerts | string | `` | no |
| oncall_warning | Define a broadcast channel for warning alerts | string | - | yes |
| prepend_text | Optional free text string to prepend to alert | string | `` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
