System Generic DataDog monitors
===============================

How to use this module
----------------------

```
module "datadog-monitors-system-generic" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//system/generic?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* System CPU High

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| custom_cpu_period | Set up period for the query | string | `last_5m` | no |
| custom_cpu_threshold_critical | Custom CPU critical threshold | string | `95` | no |
| custom_cpu_threshold_warning | Custom CPU warning threshold | string | `80` | no |
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `600` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
