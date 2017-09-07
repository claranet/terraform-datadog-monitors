


resource "datadog_monitor" "rds-mysql_cpu_80_15min" {
  name    = "RDS Mysql CPU High > 90% for 15 min"
  message = "{{#is_alert}}\n${var.critical_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.critical_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_escalation_group}\n{{/is_warning_recovery}}"
  count = "${var.dd_rds-mysql_basics == "enabled" ? 1 : 0 }"

  query = "avg(last_15m):aws.rds.cpuutilization.total{\"dd_monitoring:enabled\",\"dd_rds-mysql_basics:enabled\",\"!dd_custom_rds-mysql:enabled\"} by {host} > 90"
  type  = "query alert"

  thresholds {
    warning  = 0.8
    critical = 0.9
  }

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "mysql_rds_free_space_low" {
  name    = "rds mysql free space low < 10 %  on {{host.name}}"
  message = "{{#is_alert}}\n${var.critical_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.critical_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_escalation_group}\n{{/is_warning_recovery}}"


  type  = "service check"
  query = "avg(last_10m): 1 - avg:aws.rds.free_storage_space{\"dd_monitoring:enabled\",\"dd_rds-mysql_basics:enabled\",\"!dd_custom_rds-mysql:enabled\"} by {host} / ( avg:aws.rds.total_storage_space{\"dd_monitoring:enabled\",\"dd_rds-mysql_basics:enabled\",\"!dd_custom_rds-mysql:enabled\"} by {host} - avg:aws.rds.free_storage_space{} by {host} ) < 0.1"
  count = "${var.dd_rds-mysql_basics == "enabled" ? 1 : 0 }"

  thresholds {
    warning  = 0.2
    critical = 0.1
  }

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  renotify_interval   = 0
  no_data_timeframe   = 20



}