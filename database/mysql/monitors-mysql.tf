resource "datadog_monitor" "mysql_connection_too_high" {
  name    = "[${var.environment}] Mysql Connections {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mysql_connection_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    avg(last_15m): (
      avg:mysql.net.connections${module.filter-tags.query_alert} by {server} /
      avg:mysql.net.max_connections_available${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.mysql_connection_threshold_warning}"
    critical = "${var.mysql_connection_threshold_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_connection_silenced}"

  tags = ["env:${var.environment}", "resource:mysql"]
}

resource "datadog_monitor" "mysql_thread_too_high" {
  name    = "[${var.environment}] Mysql threads {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.mysql_thread_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    avg(last_5m): (
      avg:mysql.performance.threads_running${module.filter-tags.query_alert} by {server}
    ) > ${var.mysql_thread_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.mysql_thread_threshold_warning}"
    critical = "${var.mysql_thread_threshold_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_thread_silenced}"

  tags = ["env:${var.environment}", "resource:mysql"]
}
