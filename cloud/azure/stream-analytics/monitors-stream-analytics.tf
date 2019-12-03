resource "datadog_monitor" "status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Stream Analytics is down"
  message = coalesce(var.status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"], var.status_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "su_utilization" {
  count   = var.su_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Stream Analytics streaming units utilization too high {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.su_utilization_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.su_utilization_time_aggregator}(${var.su_utilization_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.resource_utilization${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.su_utilization_threshold_critical}
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  thresholds = {
    warning  = var.su_utilization_threshold_warning
    critical = var.su_utilization_threshold_critical
  }

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"], var.su_utilization_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "failed_function_requests" {
  count   = var.failed_function_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Stream Analytics too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_function_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_function_requests_time_aggregator}(${var.failed_function_requests_timeframe}): (
      default(avg:azure.streamanalytics_streamingjobs.aml_callout_failed_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(avg:azure.streamanalytics_streamingjobs.aml_callout_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 1)
    ) * 100 > ${var.failed_function_requests_threshold_critical}
EOQ

  thresholds = {
    warning  = var.failed_function_requests_threshold_warning
    critical = var.failed_function_requests_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"], var.failed_function_requests_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "conversion_errors" {
  count   = var.conversion_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Stream Analytics too many conversion errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.conversion_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.conversion_errors_time_aggregator}(${var.conversion_errors_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.conversion_errors${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.conversion_errors_threshold_critical}
EOQ

  thresholds = {
    warning  = var.conversion_errors_threshold_warning
    critical = var.conversion_errors_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"], var.conversion_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "runtime_errors" {
  count   = var.runtime_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Stream Analytics too many runtime errors {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.runtime_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.runtime_errors_time_aggregator}(${var.runtime_errors_timeframe}): (
      avg:azure.streamanalytics_streamingjobs.errors${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.runtime_errors_threshold_critical}
EOQ

  thresholds = {
    warning  = var.runtime_errors_threshold_warning
    critical = var.runtime_errors_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:stream-analytics", "team:claranet", "created-by:terraform"], var.runtime_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

