# README #

This repository is used to store all our monitors templates. 

These templates have to be used with dedicated agent configurations and ressource tagging to works as expected.

### How to contribute ? ###

The easiest way to contribute on this repository is to add monitors file inside the monitors repository.

### Important notes ###

*This repository will be included as a Terraform module source.
 
*Each monitors have to be disabled by default, so you have to manage this condition when you create your monitors.

*If you override a basic monitor with a custom one, you have to use tag filters on you query. (Example dd_cpu_high, if you want to override default cpu monitors)

### Module Declaration example ###

```
module "datadog-monitors" {
  source = "git:ssh://git@bitbucket.org/morea/terraform.datadog.monitors.git"

  ho_escalation_group  = "${var.ho_escalation_group}"
  hno_escalation_group = "${var.hno_escalation_group}"

  #default monitors templates integrations examples
  linux_basics  = "${var.linux_basics}"
  #nginx         = "disabled"
  #aws_rds_mysql = "disabled"

  #custom monitors template integrations examples
  #cpu_custom                        = "enabled"  #Will match the tag dd_custom_cpu (NB: it will replace the basic cpu alert)
  #cpu_custom_period                 = "60"
  #cpu_custom_warning_threshold      = "90"
  #cpu_custom_warning_escalation_msg = ${var.ho_escalation_group}
  #cpu_custom_alert_threshold        = "95"
  #cpu_custom_alert_escalation_msg   = ${var.hno_escalation_group}
}

```
