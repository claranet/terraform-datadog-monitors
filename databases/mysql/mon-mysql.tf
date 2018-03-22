data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_mysql:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "mysql_connections_15min" {
  name    = "[${var.environment}] Mysql Connections > {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"
  type    = "query alert"

  query = <<EOF
    avg(last_15m): (
      avg:mysql.net.connections{${data.template_file.filter.rendered}} /
      avg:mysql.net.max_connections{${data.template_file.filter.rendered}}
    ) * 100 > ${var.mysql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.evaluation_delay}"

  thresholds {
    warning  = "${var.mysql_connection_threshold_warning}"
    critical = "${var.mysql_connection_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = true
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:mysql"]
}


resource "datadog_monitor" "mysql_thread_5min" {
  name    = "[${var.environment}] Mysql threads > {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"
  type    = "query alert"

  query = <<EOF
    avg(last_5m): (
      avg:mysql.performance.threads_running{${data.template_file.filter.rendered}}
    ) > ${var.mysql_thread_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.evaluation_delay}"

  thresholds {
    warning  = "${var.mysql_thread_threshold_warning}"
    critical = "${var.mysql_thread_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:mysql"]
}
