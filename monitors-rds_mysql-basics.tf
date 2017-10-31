


resource "datadog_monitor" "rds-mysql_cpu_80_15min" {
  name    = "[${var.env}] rds Cpu high > 90% for 15 min on {{host.identifier}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  count = "${var.dd_aws_rds == "enabled" ? 1 : 0 }"


  query = "avg(last_15m):avg:aws.rds.cpuutilization{dd_monitoring:enabled,dd_aws_rds:enabled,env:${var.env}} by {region,name,stack} > 90"
  type  = "query alert"

  thresholds {
    warning  = "${var.rds_cpu_threshold["warning"]}"
    critical = "${var.rds_cpu_threshold["critical"]}"
  }

  notify_no_data      = "${var.rds_config["notify_no_data"]}"
  evaluation_delay    = "${var.rds_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.rds_config["delay"]}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "mysql_rds_free_space_low" {
  name    = "[${var.env}] rds free space low < 10 % on {{host.identifier}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"
  
  type  = "query alert"
  query = "avg(last_15m):avg:aws.rds.free_storage_space{dd_monitoring:enabled,dd_aws_rds:enabled,env:${var.env}} by {region,name,stack} / avg:aws.rds.total_storage_space{dd_monitoring:enabled,dd_aws_rds:enabled,env:${var.env}} by {region,name,stack} * 100 < 10"
  count = "${var.dd_aws_rds == "enabled" ? 1 : 0 }"


  thresholds {
    warning  = "${var.rds_mem_threshold["warning"]}"
    critical = "${var.rds_mem_threshold["critical"]}"
  }

  notify_no_data      = "${var.rds_config["notify_no_data"]}"
  evaluation_delay    = "${var.rds_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.rds_config["delay"]}"
  no_data_timeframe   = 20


}