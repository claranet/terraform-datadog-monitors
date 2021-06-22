#
# Service Check
#
resource "datadog_monitor" "cannot_resolve" {
  count   = var.cannot_resolve_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DNS cannot resolve"
  message = coalesce(var.cannot_resolve_message, var.message)
  type    = "service check"

  query = <<EOQ
    "dns.can_resolve"${module.filter-tags.service_check}.by("nameserver","resolved_hostname").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.cannot_resolve_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.cannot_resolve_no_data_timeframe
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:network", "provider:dns_check", "resource:dns", "team:claranet", "created-by:terraform"], var.cannot_resolve_extra_tags)
}