# README - DataDog Monitors #

This repository is used to store all our monitors templates. 

These templates have to be used with dedicated agent configurations and resource tagging to works as expected.

### How to contribute ? ###

The easiest way to contribute on this repository is to add monitors file inside the monitors repository.

### Important notes ###

* This repository will be included as a Terraform module source.
* Each monitors have to be disabled by default, so you have to manage this condition when you create your monitors.
* If you override a basic monitor with a custom one, you have to use tag filters on you query. (Example dd_cpu_high, if you want to override default cpu monitors)

### Main.tf : add the DataDog provider ###

```
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

### Module Declaration example ###

```
module "datadog-monitors" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//{module-path}?ref={version}"

  critical_escalation_group = "${var.critical_escalation_group}"
  warning_escalation_group  = "${var.warning_escalation_group}"

  #default monitors templates integrations examples
  dd_linux_basics  = "${var.dd_linux_basics}"
  #nginx         = "false"
  #aws_rds_mysql = "false"

  dd_custom_cpu = "${var.dd_custom_cpu}"
}
```

### Input Declaration example ###

```
variable "critical_escalation_group" {
  default = "@pagerduty_HODummy"
}
variable "warning_escalation_group" {
  default = "@pagerduty_HNODummy"
}

variable "datadog_app_key" {}
variable "datadog_api_key" {}

##Set this variable to true if you want to keep the default tags (tags in query directive)
variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

##If you have to set custom tags, you have to set the previous input to false and add your tags in this variable
variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}


variable "dd_linux_basics" {
  default = "enabled"
}

variable "dd_custom_cpu" {
  type = "map"
  default = {
    status = "enabled"
    name   = "CPU High > 95% during 1 hour"

    period = "last_1h"

    critical_threshold = 95
    warning_threshold  = 90
  }
}
```
