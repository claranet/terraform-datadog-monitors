module "datadog-monitors" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git"

  env     = "${var.environment}"
  region  = "${var.region}"

  critical_escalation_group = "${var.critical_escalation_group}"
  warning_escalation_group  = "${var.warning_escalation_group}"


  dd_aws_rds = "${var.dd_aws_rds}"
  dd_linux_basics  = "${var.dd_linux_basics}"

}
