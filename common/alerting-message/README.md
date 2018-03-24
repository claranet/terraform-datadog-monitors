Alerting Message Datadog Generator
==================================

How to use this module
----------------------

```
module "datadog-message-alerting" {
  source                 = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//common/alerting-message?ref={revision}"

  oncall_24x7            = "${var.oncall_24x7}"
  oncall_office_hours    = "${var.oncall_office_hours}"
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
| oncall_24x7 | Define PagerDuty NBH service name for alerts and nodata | string | - | yes |
| oncall_office_hours | Define PagerDuty BH service name for warning alerts | string | - | yes |
| prepend_text | Optional free text string to prepend to alert | string | `` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
