resource "datadog_monitor" "Nginx_process" {
  name    = "Nginx process is down on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"


  type  = "service check"
  query = "\"process.up\".over(\"dd_monitoring:enabled"\,\"process:nginx\").exclude(\"dd_custom_nginx:enabled\").last(4).count_by_status()"
  count = "${var.nginx_basics == "true" ? 1 : 0 }"

  thresholds = {
    ok = 1
    warning = 2
    critical = 4
  }

  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}
