data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_php_fpm:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "datadog_php_fpm_connect_idle" {
  name    = "[${var.environment}] php_fpm busy worker {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.php_fpm_busy_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    avg(${var.php_fpm_busy_timeframe}): (
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
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.php_fpm_busy_silenced}"

  tags = ["env:${var.environment}", "resource:php-fpm"]
}

resource "datadog_monitor" "datadog_fpm_process" {
  name    = "[${var.environment}] Can't connect to php-fpm"
  message = "${coalesce(var.php_fpm_connect_message, var.message)}"

  type = "service check"

  query = <<EOF
    "php_fpm.can_ping".over("${data.template_file.filter.rendered}").by("host","port").last(6).count_by_status()
  EOF

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.php_fpm_connect_silenced}"

  tags = ["env:${var.environment}", "resource:php-fpm"]
}
