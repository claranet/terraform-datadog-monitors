resource "datadog_monitor" "SU_utilization" {
  name    = "[${var.environment}] SU utilization at more than ${var.su_utilization_critical}% on {{name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.resource_utilization{*} by {name,resource_group} > ${var.su_utilization_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.su_utilization_warning}"
    critical = "${var.su_utilization_critical}"
  }
}

resource "datadog_monitor" "failed_function_requests" {
  name    = "[${var.environment}] More than ${var.failed_function_requests_critical} failed function requests on {{name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.aml_callout_failed_requests{*} by {name,resource_group} > ${var.failed_function_requests_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.failed_function_requests_warning}"
    critical = "${var.failed_function_requests_critical}"
  }
}

resource "datadog_monitor" "conversion_errors" {
  name    = "[${var.environment}] More than ${var.conversion_errors_critical} conversion errors on {{name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.conversion_errors{*} by {name,resource_group} > ${var.conversion_errors_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.conversion_errors_warning}"
    critical = "${var.conversion_errors_critical}"
  }
}

resource "datadog_monitor" "runtime_errors" {
  name    = "[${var.environment}] More than ${var.runtime_errors_critical} runtime errors on {{name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.errors{*} by {name,resource_group} > ${var.runtime_errors_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.runtime_errors_warning}"
    critical = "${var.runtime_errors_critical}"
  }
}
