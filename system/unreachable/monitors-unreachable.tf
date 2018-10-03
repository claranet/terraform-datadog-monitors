resource "datadog_monitor" "host_unreachable" {
  count   = "${var.unreachable_enabled ? 1 : 0}"
  name    = "[${var.environment}] Host unreachable"
  message = "${coalesce(var.unreachable_message, var.message)}"

  query = "\"datadog.agent.up\"${module.filter-tags.service_check}.last(6).count_by_status()"

  type = "service check"

  thresholds {
    ok       = 1
    warning  = 1
    critical = 5
  }

  notify_no_data      = true
  no_data_timeframe   = "${var.unreachable_no_data_timeframe}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.unreachable_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:host", "resource:unreachable", "team:claranet", "created-by:terraform", "${var.unreachable_extra_tags}"]
}
