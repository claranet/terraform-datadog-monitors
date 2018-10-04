resource "datadog_monitor" "datadog_process_check" {
  count   = "${var.process_check_enabled ? 1 : 0}"
  name    = "[${var.environment}] {{dd_process_name.name}} process is down"
  message = "${coalesce(var.process_check_message, var.message)}"

  query = "max(last_5m):min:system.processes.number${module.filter-tags.query_alert} by {host,dd_process_name} < 1"

  type = "metric alert"

  thresholds {
    critical = 1
  }

  notify_no_data      = true
  evaluation_delay    = 15
  no_data_timeframe   = "${var.process_check_no_data_timeframe}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.process_check_silenced}"

  tags = ["env:${var.environment}", "type:process", "provider:process-check", "resource:custom", "team:claranet", "created-by:terraform", "${var.process_check_extra_tags}"]
}
