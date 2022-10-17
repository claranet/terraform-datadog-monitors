# ALERTING MESSAGE Datadog Generator

## How to use this module

```
module "datadog-message-alerting" {
  source  = "claranet/monitors/datadog//common/alerting-message"

  message_alert      = var.oncall_24x7
  message_warning    = var.oncall_business_hours
  message_nodata     = var.oncall_nodata
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
| message_warning | Define a broadcast channel for warning alerts | string | - | no |
| prepend_text | Optional free text string to prepend to alert | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| alerting-message | The generated message string |

<!-- END_TF_DOCS -->
## Related documentation

Datadog notifications official documentation: [https://docs.datadoghq.com/monitors/notifications/?tab=is_alertis_warning](https://docs.datadoghq.com/monitors/notifications/?tab=is_alertis_warning)

## Notes

This module aims to generate a valid message to split notification into different destinations based on its type (alert, warning, no data).

If this way matchs your need so you should be able to use its output alone directly for your monitors.
You can even use `append_text` and `prepend_text` variables to add context or documentation to monitors.

Else you can still use its output with one or multiple destinations to use it in your own messsage (i.e. with `{{#is_match}}` splitting mechanism).

Here is some tips to understand the behavior of this module and espacially its resulted output:
* Only `message_alert` is mandatory
* If `message_warning` or `message_nodata` are not defined it will use `message_alert` by default
* You can "disable" one notification type by set its variable to empty (i.e. `message_warning = ""`)
* feel free to use this module multiple times with different combinations to suit your needs
