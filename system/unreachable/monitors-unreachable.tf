resource "datadog_monitor" "host_unreachable" {
  count   = var.unreachable_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Host unreachable"
  message = coalesce(var.unreachable_message, var.message)
  type    = "service check"

  query = <<EOQ
    "datadog.agent.up"${module.filter-tags.service_check}.last(6).count_by_status()
EOQ

  monitor_thresholds {
    ok       = 1
    warning  = 1
    critical = 5
  }

  no_data_timeframe   = var.unreachable_no_data_timeframe
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:system", "provider:host", "resource:unreachable", "team:claranet", "created-by:terraform"], var.unreachable_extra_tags)
}

