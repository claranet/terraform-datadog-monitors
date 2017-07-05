module "datadog-monitors" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.datadog.monitors.git"

  critical_escalation_group = "${var.critical_escalation_group}"
  warning_escalation_group  = "${var.warning_escalation_group}"

  #default monitors templates integrations examples
  dd_linux_basics  = "${var.dd_linux_basics}"
  #nginx         = "false"
  #aws_rds_mysql = "false"

  dd_custom_cpu = "${var.dd_custom_cpu}"
}
