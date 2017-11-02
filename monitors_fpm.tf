resource "datadog_monitor" "php-fpm_process_idle" {
  name    = "[${var.env}] php_fpm busy worker > 90% on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"


  type  = "query alert"
  query = "avg(last_10m):avg:php_fpm.processes.active{dd_monitoring:enabled,dd_php_fpm:enabled,env:${var.env}} by {host,region} / ( avg:php_fpm.processes.idle{dd_monitoring:enabled,dd_php_fpm:enabled,env:${var.env}} by {host,region} + avg:php_fpm.processes.active{dd_monitoring:enabled,dd_php_fpm:enabled,env:${var.env}} by {host,region} ) > 0.9"
  count = "${var.dd_php_fpm == "enabled" ? 1 : 0 }"

  thresholds {
    warning  = "${var.php_fpm_busy_threshold["warning"]}"
    critical = "${var.php_fpm_busy_threshold["critical"]}"
  }

  notify_no_data      = "${var.apache_nginx_fpm_config["notify_no_data"]}"
  evaluation_delay    = "${var.apache_nginx_fpm_config["delay"]}"
  new_host_delay      = "${var.apache_nginx_fpm_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["*"]
}


resource "datadog_monitor" "FPM_process" {
  name    = "[${var.env}] FPM process is down on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"


  type  = "service check"
  query = "\"process.up\".over(\"dd_monitoring:enabled\",\"dd_php_fpm:enabled\",\"process:php_fpm\",\"env:${var.env}\").by(\"host\",\"process\", \"app\").last(4).count_by_status()"
  count = "${var.dd_nginx == "enabled" ? 1 : 0 }"

  thresholds = {
    ok = 1
    warning = 2
    critical = 4
  }

  notify_no_data      = "${var.apache_nginx_fpm_config["notify_no_data"]}"
  evaluation_delay    = "${var.apache_nginx_fpm_config["delay"]}"
  new_host_delay      = "${var.apache_nginx_fpm_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  tags = ["*"]
}
