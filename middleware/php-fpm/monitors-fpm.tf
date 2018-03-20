data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_php_fpm:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "datadog_php_fpm_process_idle" {
  name    = "[${var.environment}] php_fpm busy worker {{#is_alert}}{{comparator}}{{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}}{{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  type = "metric alert"

  query = <<EOF
    avg(last_10m): (
      avg:php_fpm.processes.active{${data.template_file.filter.rendered}} by {region, host} /
      ( avg:php_fpm.processes.idle{${data.template_file.filter.rendered}} by {region, host} +
       avg:php_fpm.processes.active{${data.template_file.filter.rendered}} by {region, host} )
    ) > ${var.php_fpm_busy_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.php_fpm_busy_threshold_warning}"
    critical = "${var.php_fpm_busy_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay_metric}"
  new_host_delay      = "${var.evaluation_delay_metric}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:php-fpm"]
}

resource "datadog_monitor" "datadog_fpm_process" {
  name    = "[${var.environment}] Can't connect to php-fpm"
  message = "${var.message}"

  type  = "service check"
  query = "\"php_fpm.can_ping\".over(\"dd_monitoring:enabled\",\"dd_php_fpm:enabled\",\"env:${var.environment}\").by(\"host\",\"port\").last(6).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay_service}"
  new_host_delay      = "${var.evaluation_delay_service}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:php-fpm"]
}
