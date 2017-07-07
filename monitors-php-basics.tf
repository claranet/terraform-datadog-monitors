resource "datadog_monitor" "php-fpm_process_idle" {
  name    = "php_fpm busy worker > 99% on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"


  type  = "service check"
  query = "avg(last_10m):avg:php_fpm.processes.active{\"dd_monitoring:enabled\",\"dd_php_basics:enabled\",\"!dd_custom_php:enabled\"} by {host} / ( avg:php_fpm.processes.idle{\"dd_monitoring:enabled\",\"dd_php_basics:enabled\",\"!dd_custom_php:enabled\"} by {host} + avg:php_fpm.processes.active{\"dd_monitoring:enabled\",\"dd_php_basics:enabled\",\"!dd_custom_php:enabled\"} by {host} ) > 0.99"
  count = "${var.apache_basics == "true" ? 1 : 0 }"

  thresholds {
    warning  = 0.95
    critical = 0.99
  }

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  renotify_interval   = 0
  no_data_timeframe   = 20
}


