data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_rds:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "php-fpm_process_idle" {
  name    = "[${var.environment}] php_fpm busy worker {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
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

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay_metric}"
  new_host_delay      = "${var.evaluation_delay_metric}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "type:php-fpm"]
}

resource "datadog_monitor" "FPM_process" {
  name    = "[${var.environment}] FPM process is down on {{host.name}}"
  message = "${var.message}"

  type  = "service check"
  query = "\"process.up\".over(\"dd_monitoring:enabled\",\"dd_php_fpm:enabled\",\"process:php_fpm\",\"env:${var.environment}\").by(\"host\",\"process\", \"app\").last(4).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay_service}"
  new_host_delay      = "${var.evaluation_delay_service}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "type:php-fpm"]
}
