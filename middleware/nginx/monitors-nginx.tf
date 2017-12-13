resource "datadog_monitor" "Nginx_process" {
  name    = "[${var.env}] Nginx process is down on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  type  = "service check"
  query = "\"process.up\".over(\"dd_monitoring:enabled\",\"dd_nginx:enabled\",\"process:nginx\",\"env:${var.env}\").by(\"host\",\"process\", \"app\").last(4).count_by_status()"
  count = "${var.dd_nginx == "enabled" ? 1 : 0 }"

  thresholds = {
    ok       = 1
    warning  = 2
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

  tags = ["env:${var.env}", "type:nginx"]
}
