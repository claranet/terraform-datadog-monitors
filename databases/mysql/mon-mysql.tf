data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_mysql:enabled,db_env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "mysql_connection_too_high" {
  name    = "[${var.environment}] Mysql Connections {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${coalesce(var.mysql_connection_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    avg(last_15m): (
      avg:mysql.net.connections{${data.template_file.filter.rendered}} by {region,dd_host} /
      avg:mysql.net.max_connections{${data.template_file.filter.rendered}} by {region,dd_host}
    ) * 100 > ${var.mysql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.evaluation_delay}"

  thresholds {
    warning  = "${var.mysql_connection_threshold_warning}"
    critical = "${var.mysql_connection_threshold_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_connection_silenced}"

  tags = ["env:${var.environment}", "resource:mysql"]
}

resource "datadog_monitor" "mysql_thread_too_high" {
  name    = "[${var.environment}] Mysql threads {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${coalesce(var.mysql_thread_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    avg(last_5m): (
      avg:mysql.performance.threads_running{${data.template_file.filter.rendered}} by {region,dd_host}
    ) > ${var.mysql_thread_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.evaluation_delay}"

  thresholds {
    warning  = "${var.mysql_thread_threshold_warning}"
    critical = "${var.mysql_thread_threshold_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_thread_silenced}"

  tags = ["env:${var.environment}", "resource:mysql"]
}
