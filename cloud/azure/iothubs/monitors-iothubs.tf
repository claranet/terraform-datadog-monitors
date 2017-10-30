resource "datadog_monitor" "too_many_jobs_failed" {
  name    = "[${var.environment}] Too many jobs failed on {{name}} "
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "sum(last_5m):( avg:azure.devices_iothubs.jobs.failed{*} by {name,resource_group}.as_count() / ( avg:azure.devices_iothubs.jobs.failed{*} by {name,resource_group}.as_count() + avg:azure.devices_iothubs.jobs.completed{*} by {name,resource_group}.as_count() ) ) * 100 > ${var.critical_jobs_failed}"
  type  = "query alert"

  thresholds {
    warning  = "${var.warning_jobs_failed}"
    critical = "${var.critical_jobs_failed}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_list_jobs_failed" {
  name    = "[${var.environment}] Too many list_jobs failure on {{name}} "
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "sum(last_5m):( avg:azure.devices_iothubs.jobs.list_jobs.failure{*} by {resource_group,name}.as_count() / ( avg:azure.devices_iothubs.jobs.list_jobs.success{*} by {resource_group,name}.as_count() + avg:azure.devices_iothubs.jobs.list_jobs.failure{*} by {resource_group,name}.as_count() ) ) * 100 > ${var.critical_listjobs_failed}"
  type  = "query alert"

  thresholds {
    warning  = "${var.warning_listjobs_failed}"
    critical = "${var.critical_listjobs_failed}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_query_jobs_failed" {
  name    = "[${var.environment}] Too many query_jobs failed on {{name}} "
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "sum(last_5m):( avg:azure.devices_iothubs.jobs.query_jobs.failure{*} by {resource_group,name}.as_count() / ( avg:azure.devices_iothubs.jobs.query_jobs.success{*} by {resource_group,name}.as_count() + avg:azure.devices_iothubs.jobs.query_jobs.failure{*} by {resource_group,name}.as_count() ) ) * 100 > ${var.critical_queryjobs_failed}"
  type  = "query alert"

  thresholds {
    warning  = "${var.warning_queryjobs_failed}"
    critical = "${var.critical_queryjobs_failed}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "status" {
  name    = "[${var.environment}] Status is not ok on {{name}} "
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "avg(last_5m):avg:azure.devices_iothubs.status{*} by {name,resource_group} < 1"
  type  = "query alert"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}