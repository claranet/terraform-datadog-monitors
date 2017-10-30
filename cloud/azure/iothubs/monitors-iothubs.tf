resource "datadog_monitor" "too_many_jobs_failed" {
  name    = "[${var.environment}] Too many jobs failed on {{name}} "
  message = "${var.jobs_failed_message}"

  query = "sum(last_5m):( avg:azure.devices_iothubs.jobs.failed{*} by {name,resource_group}.as_count() / ( avg:azure.devices_iothubs.jobs.failed{*} by {name,resource_group}.as_count() + avg:azure.devices_iothubs.jobs.completed{*} by {name,resource_group}.as_count() ) ) * 100 > ${var.jobs_failed_threshold_critical}"
  type  = "query alert"

  thresholds {
    warning  = "${var.jobs_failed_threshold_warning}"
    critical = "${var.jobs_failed_threshold_critical}"
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
  message = "${var.listjobs_failed_message}"

  query = "sum(last_5m):( avg:azure.devices_iothubs.jobs.list_jobs.failure{*} by {resource_group,name}.as_count() / ( avg:azure.devices_iothubs.jobs.list_jobs.success{*} by {resource_group,name}.as_count() + avg:azure.devices_iothubs.jobs.list_jobs.failure{*} by {resource_group,name}.as_count() ) ) * 100 > ${var.listjobs_failed_threshold_critical}"
  type  = "query alert"

  thresholds {
    warning  = "${var.listjobs_failed_threshold_warning}"
    critical = "${var.listjobs_failed_threshold_critical}"
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
  message = "${var.queryjobs_failed_message}"

  query = "sum(last_5m):( avg:azure.devices_iothubs.jobs.query_jobs.failure{*} by {resource_group,name}.as_count() / ( avg:azure.devices_iothubs.jobs.query_jobs.success{*} by {resource_group,name}.as_count() + avg:azure.devices_iothubs.jobs.query_jobs.failure{*} by {resource_group,name}.as_count() ) ) * 100 > ${var.queryjobs_failed_threshold_critical}"
  type  = "query alert"

  thresholds {
    warning  = "${var.queryjobs_failed_threshold_warning}"
    critical = "${var.queryjobs_failed_threshold_warning}"
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
  message = "${var.status_message}"

  query = "avg(last_5m):avg:azure.devices_iothubs.status{*} by {name,resource_group} < 1"
  type  = "query alert"

  notify_no_data      = true
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

resource "datadog_monitor" "total_devices" {
  name    = "[${var.environment}] Total devices is wrong on {{name}} "
  message = "${var.total_devices_message}"

  query = "avg(last_5m):avg:azure.devices_iothubs.devices.total_devices{*} by {name,resource_group} == 0"
  type  = "query alert"

  notify_no_data      = true
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

resource "datadog_monitor" "too_many_c2d_methods_failed" {
  name    = "[${var.environment}] Too many c2d methods failure on {{name}} "
  message = "${var.c2d_methods_failed_message}"

  query = "avg(last_5m):( avg:azure.devices_iothubs.c2d.methods.failure{*} by {name,resource_group}.as_count() / ( avg:azure.devices_iothubs.c2d.methods.failure{*} by {name,resource_group}.as_count() + avg:azure.devices_iothubs.c2d.methods.success{*} by {name,resource_group}.as_count() ) ) * 100 > ${var.c2d_methods_failed_threshold_critical}"
  type  = "query alert"

  thresholds {
    warning  = "${var.c2d_methods_failed_threshold_warning}"
    critical = "${var.c2d_methods_failed_threshold_critical}"
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