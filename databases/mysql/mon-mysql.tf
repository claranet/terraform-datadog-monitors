resource "datadog_monitor" "mysql_cpu_80_15min" {
  name    = "[${var.environment}] Mysql Connections > {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"
  type  = "query alert"

  query = <<EOF
    avg(last_15m): (
      avg:mysql.net.connections{db_env:${var.environment},dd_monitoring:enabled,dd_mysql:enabled} /
      avg:mysql.net.max_connections{db_env:${var.environment},dd_monitoring:enabled,dd_mysql:enabled}
    ) * 100 > ${var.mysql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.mysql_connection_threshold_warning}"
    critical = "${var.mysql_connection_threshold_critical}"
  }

  notify_no_data      = false # Will NOT notify when no data is received
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:mysql"]
}


resource "datadog_monitor" "mysql_thread_5min" {
  name    = "[${var.environment}] Mysql threads > {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"
  type  = "query alert"

  query = <<EOF
    avg(last_5m): (
      avg:mysql.performance.threads_running{db_env:${var.environment},dd_monitoring:enabled,dd_mysql:enabled}
    ) > ${var.mysql_thread_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.mysql_thread_threshold_warning}"
    critical = "${var.mysql_thread_threshold_critical}"
  }

  notify_no_data      = false # Will NOT notify when no data is received
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:mysql"]
}
