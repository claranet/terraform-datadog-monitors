resource "datadog_monitor" "apache_process" {
  name    = "Apache process is down on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"


  type  = "service check"
  query = "\"process.up\".over(\"dd_monitoring:enabled"\,\"dd_apache_basics:enabled\",\"process:apache2\").exclude(\"dd_custom_apache:enabled\").last(4).count_by_status()"
  count = "${var.apache_basics == "true" ? 1 : 0 }"

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

resource "datadog_monitor" "apache_worker_nat" {
  name    = "Apache proxy busy worker > 99% on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  query = "avg(last_10m):avg:php_fpm.process.active{\"dd_monitoring:enabled\",\"dd_apache_basics:enabled\",\"!dd_custom_apache:enabled\"} by {host} / ( avg:php_fpm.process.idle{\"dd_monitoring:enabled\",\"dd_apache_basics:enabled\",\"!dd_custom_apache:enabled\"} by {host} + avg:apache.performance.busy_workers{\"dd_monitoring:enabled\",\"dd_apache_basics:enabled\",\"!dd_custom_apache:enabled\"} by {host} ) > 0.99"
  type  = "query alert"

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
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "apache_can_connect" {
  name    = "Apache proxy is down on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  query = "\"apache.can_connect\".over\"dd_monitoring:enabled"\,\"dd_apache_basics:enabled\",\"process:apache2\").exclude(\"dd_custom_apache:enabled\").last(1).count_by_status()"
  type  = "service check"

  count = "${var.apache_basics == "true" ? 1 : 0 }"

  notify_no_data      = false
  renotify_interval   = 60
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


//enchanced monitoring étant donné


