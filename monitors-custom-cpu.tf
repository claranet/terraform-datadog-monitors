resource "datadog_monitor" "cpu_custom" {
  name    = "${var.dd_custom_cpu["name"]}"
  message = "{{#is_alert}}\n${var.critical_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.critical_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_escalation_group}\n{{/is_warning}}\n{{#is_warning_recovery}}\n${var.warning_escalation_group}\n{{/is_warning_recovery}}"
  count   = "${var.dd_custom_cpu["status"] == "enabled" ? 1 : 0}"

  query = "min(${var.dd_custom_cpu["period"]}):avg:system.cpu.system{dd_monitoring:enabled,dd_linux_basics:enabled,!dd_custom_cpu.monitoring:enabled} by {host} + avg:system.cpu.user{dd_monitoring:enabled,dd_linux_basics:enabled,!dd_custom_cpu:enabled} by {host} > ${var.dd_custom_cpu["critical_threshold"]}"
  type  = "query alert"

  thresholds = {
    warning  = "${var.dd_custom_cpu["warning_threshold"]}"
    critical = "${var.dd_custom_cpu["critical_threshold"]}"
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

