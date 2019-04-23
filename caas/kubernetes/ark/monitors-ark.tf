resource "datadog_monitor" "ark_schedules_monitor" {
  count   = "${var.ark_schedules_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Ark backup failed"
  type    = "metric alert"
  message = "${coalesce(var.ark_schedules_monitor_message, var.message)}"

  query = <<EOF
    sum(${var.ark_schedules_monitor_timeframe}):min:ark.ark_backup_failure_total${module.filter-tags.query_alert} by {schedule}.as_count() > 1
  EOF

  thresholds {
    critical = 1
    warning  = 0
  }

  evaluation_delay  = "${var.evaluation_delay}"
  new_host_delay    = "${var.new_host_delay}"
  no_data_timeframe = "${var.ark_schedules_monitor_no_data_timeframe}"

  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  silenced = "${var.ark_schedules_monitor_silenced}"
  tags     = ["env:${var.environment}", "type:caas", "provider:prometheus", "resource:ark", "team:claranet", "created-by:terraform", "${var.ark_schedules_extra_tags}"]
}
