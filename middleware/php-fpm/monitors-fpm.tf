resource "datadog_monitor" "php_fpm_connect" {
  count   = "${var.php_fpm_connect_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Php-fpm ping url does not respond"
  message = "${coalesce(var.php_fpm_connect_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "php_fpm.can_ping"${module.filter-tags.service_check}.by("ping_url").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.php_fpm_connect_threshold_warning}"
    critical = 5
  }

  notify_no_data      = true
  no_data_timeframe   = "${var.php_fpm_connect_no_data_timeframe}"
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = ["env:${var.environment}", "type:middleware", "provider:php-fpm", "resource:php-fpm", "team:claranet", "created-by:terraform", "${var.php_fpm_connect_extra_tags}"]
}

resource "datadog_monitor" "php_fpm_connect_idle" {
  count   = "${var.php_fpm_busy_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Php-fpm busy worker {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.php_fpm_busy_message, var.message)}"

  type = "metric alert"

  query = <<EOQ
    ${var.php_fpm_busy_time_aggregator}(${var.php_fpm_busy_timeframe}): (
      avg:php_fpm.processes.active${module.filter-tags.query_alert} by {host, pool} /
      ( avg:php_fpm.processes.idle${module.filter-tags.query_alert} by {host, pool} +
       avg:php_fpm.processes.active${module.filter-tags.query_alert} by {host, pool} )
    ) * 100 > ${var.php_fpm_busy_threshold_critical}
  EOQ

  thresholds {
    warning  = "${var.php_fpm_busy_threshold_warning}"
    critical = "${var.php_fpm_busy_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = ["env:${var.environment}", "type:middleware", "provider:php-fpm", "resource:php-fpm", "team:claranet", "created-by:terraform", "${var.php_fpm_busy_extra_tags}"]
}
