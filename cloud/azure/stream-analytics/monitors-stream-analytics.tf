data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_streamanalytics:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "status" {
  name    = "[${var.environment}] Stream Analytics Status is not ok on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):avg:azure.streamanalytics_streamingjobs.status{${data.template_file.filter.rendered}} by {name,resource_group} < 1
  EOF
  type  = "metric alert"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:streamanalytics", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "su_utilization" {
  name    = "[${var.environment}] Stream Analytics streaming Units utilization at more than ${var.su_utilization_threshold_critical}% on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.streamanalytics_streamingjobs.resource_utilization{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.su_utilization_threshold_critical}
  EOF
  type  = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.su_utilization_threshold_warning}"
    critical = "${var.su_utilization_threshold_critical}"
  }

  tags = ["env:${var.environment}", "resource:streamanalytics", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "failed_function_requests" {
  name    = "[${var.environment}] Stream Analytics more than ${var.failed_function_requests_threshold_critical} failed function requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.streamanalytics_streamingjobs.aml_callout_failed_requests{${data.template_file.filter.rendered}} by {name,resource_group}.as_count() /
       avg:azure.streamanalytics_streamingjobs.aml_callout_requests{${data.template_file.filter.rendered}} by {name,resource_group}.as_count()
    ) * 100 > ${var.failed_function_requests_threshold_critical}
  EOF
  type  = "metric alert"

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
  thresholds {
    warning  = "${var.function_requests_threshold_warning}"
    critical = "${var.failed_function_requests_threshold_critical}"
  }

  tags = ["env:${var.environment}", "resource:streamanalytics", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "conversion_errors" {
  name    = "[${var.environment}] Stream Analytics more than ${var.conversion_errors_threshold_critical} conversion errors on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.streamanalytics_streamingjobs.conversion_errors{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.conversion_errors_threshold_critical}
  EOF
  type  = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.conversion_errors_threshold_warning}"
    critical = "${var.conversion_errors_threshold_critical}"
  }

  tags = ["env:${var.environment}", "resource:streamanalytics", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "runtime_errors" {
  name    = "[${var.environment}] Stream Analytics more than ${var.runtime_errors_threshold_critical} runtime errors on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.streamanalytics_streamingjobs.errors{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.runtime_errors_threshold_critical}
  EOF
  type  = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.runtime_errors_threshold_warning}"
    critical = "${var.runtime_errors_threshold_critical}"
  }

  tags = ["env:${var.environment}", "resource:streamanalytics", "team:azure", "provider:azure"]
}
