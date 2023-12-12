resource "datadog_monitor" "host_unreachable" {
  count   = var.unreachable_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Host unreachable"
  message = coalesce(var.unreachable_message, var.message)
  type    = "service check"

  query = <<EOQ
    "datadog.agent.up"${module.filter-tags.service_check}.by("host").last(6).count_by_status()
EOQ

  monitor_thresholds {
    ok       = 1
    warning  = 1
    critical = 5
  }

  no_data_timeframe   = var.unreachable_no_data_timeframe
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.unreachable_extra_tags)
}

