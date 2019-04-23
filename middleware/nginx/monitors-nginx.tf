resource "datadog_monitor" "datadog_nginx_process" {
  count   = "${var.nginx_connect_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Nginx vhost status does not respond"
  message = "${coalesce(var.nginx_connect_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "nginx.can_connect"${module.filter-tags.service_check}.by("server","port").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.nginx_connect_threshold_warning}"
    critical = 5
  }

  notify_no_data      = true
  no_data_timeframe   = "${var.nginx_connect_no_data_timeframe}"
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.nginx_connect_silenced}"

  tags = ["env:${var.environment}", "type:middleware", "provider:nginx", "resource:nginx", "team:claranet", "created-by:terraform", "${var.nginx_connect_extra_tags}"]
}

resource "datadog_monitor" "datadog_nginx_dropped_connections" {
  count   = "${var.nginx_dropped_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Nginx dropped connections {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.nginx_dropped_message, var.message)}"

  type = "metric alert"

  query = <<EOQ
    ${var.nginx_dropped_time_aggregator}(${var.nginx_dropped_timeframe}):
      avg:nginx.net.conn_dropped_per_s${module.filter-tags.query_alert} by {host}
    > ${var.nginx_dropped_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.nginx_dropped_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.nginx_dropped_silenced}"

  tags = ["env:${var.environment}", "type:middleware", "provider:nginx", "resource:nginx", "team:claranet", "created-by:terraform", "${var.nginx_dropped_extra_tags}"]
}
