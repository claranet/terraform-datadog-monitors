# ALERTING MESSAGE Datadog Generator

## How to use this module

```
module "datadog-message-alerting" {
  source            = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//common/alerting-message?ref={revision}"

  message_alert      = "${var.oncall_24x7}"
  message_warning    = "${var.oncall_business_hours}"
  message_nodata     = "${var.oncall_nodata}"
}
```

## Purpose

Creates a DataDog monitor alert message with the following inputs :

* A broadcast channel for critical alerts
* A broadcast channel for nodata alerts
* A broadcast channel for warning alerts
* Prepend text free string
* Append text free string

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| append_text | Optional free text string to append to alert | string | `` | no |
| message_alert | Define a broadcast channel for critical alerts | string | - | yes |
| message_nodata | Define a broadcast channel for nodata alerts | string | `` | no |
| message_warning | Define a broadcast channel for warning alerts | string | - | yes |
| prepend_text | Optional free text string to prepend to alert | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| alerting-message | The generated message string |

## Related documentation

