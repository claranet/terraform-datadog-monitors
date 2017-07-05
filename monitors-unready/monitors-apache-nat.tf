resource "datadog_monitor" "apache_worker_nat" {
  name    = "Apache proxy busy worker > 99% on nat"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"

  query = "avg(last_10m):avg:apache.performance.busy_workers{*} by {host} / ( avg:apache.performance.idle_workers{*} by {host} + avg:apache.performance.busy_workers{*} by {host} ) > 0.99"
  type  = "query alert"

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

resource "datadog_monitor" "apache_process_nat" {
  name    = "Apache proxy is down on nat"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"

  query = "\"apache.can_connect\".over(\"*\").by(\"host\",\"port\").last(1).count_by_status()"
  type  = "service check"

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
