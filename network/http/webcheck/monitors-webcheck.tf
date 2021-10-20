#
# HTTP Cannot Connect
#
resource "datadog_monitor" "cannot_connect" {
  count   = var.cannot_connect_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] HTTP cannot connect"
  message = coalesce(var.cannot_connect_message, var.message)
  type    = "service check"

  query = <<EOQ
    "http.can_connect"${module.filter-tags.service_check}.by("instance","url").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.cannot_connect_threshold_warning
    critical = 5
  }

  new_group_delay     = var.new_group_delay
  no_data_timeframe   = var.cannot_connect_no_data_timeframe
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:network", "provider:http_check", "resource:webcheck", "team:claranet", "created-by:terraform"], var.cannot_connect_extra_tags)
}
