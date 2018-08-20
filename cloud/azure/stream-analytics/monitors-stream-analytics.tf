resource "datadog_monitor" "status" {
  name    = "[${var.environment}] Stream Analytics is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) < 1
  EOF

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "su_utilization" {
  name    = "[${var.environment}] Stream Analytics streaming units utilization too high {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.su_utilization_message, var.message)}"

  query = <<EOF
    ${var.su_utilization_time_aggregator}(${var.su_utilization_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.resource_utilization${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.su_utilization_threshold_critical}
  EOF

  type = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.su_utilization_threshold_warning}"
    critical = "${var.su_utilization_threshold_critical}"
  }

  silenced = "${var.su_utilization_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "failed_function_requests" {
  name    = "[${var.environment}] Stream Analytics too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_function_requests_message, var.message)}"

  query = <<EOF
    sum(${var.failed_function_requests_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.aml_callout_failed_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
       avg:azure.streamanalytics_streamingjobs.aml_callout_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
    ) * 100 > ${var.failed_function_requests_threshold_critical}
  EOF

  type = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.failed_function_requests_threshold_warning}"
    critical = "${var.failed_function_requests_threshold_critical}"
  }

  silenced = "${var.failed_function_requests_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "conversion_errors" {
  name    = "[${var.environment}] Stream Analytics too many conversion errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.conversion_errors_message, var.message)}"

  query = <<EOF
    ${var.conversion_errors_time_aggregator}(${var.conversion_errors_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.conversion_errors${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.conversion_errors_threshold_critical}
  EOF

  type = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.conversion_errors_threshold_warning}"
    critical = "${var.conversion_errors_threshold_critical}"
  }

  silenced = "${var.conversion_errors_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "runtime_errors" {
  name    = "[${var.environment}] Stream Analytics too many runtime errors {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.runtime_errors_message, var.message)}"

  query = <<EOF
    ${var.runtime_errors_time_aggregator}(${var.runtime_errors_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.errors${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.runtime_errors_threshold_critical}
  EOF

  type = "metric alert"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.runtime_errors_threshold_warning}"
    critical = "${var.runtime_errors_threshold_critical}"
  }

  silenced = "${var.runtime_errors_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"]
}
