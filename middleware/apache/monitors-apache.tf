resource "datadog_monitor" "datadog_apache_process" {
  count   = var.apache_connect_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Apache vhost status does not respond"
  message = coalesce(var.apache_connect_message, var.message)
  type    = "service check"

  query = <<EOQ
    "apache.can_connect"${module.filter-tags.service_check}.by("port","server").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.apache_connect_threshold_warning
    critical = 5
  }

  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.datadog_apache_process_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:middleware", "provider:apache", "resource:apache", "team:claranet", "created-by:terraform"], var.apache_connect_extra_tags)
}

