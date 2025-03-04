resource "datadog_monitor" "eventhub_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Event Hub is down"
  message = coalesce(var.status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
       avg:azure.eventhub_namespaces.count${module.filter-tags-status.query_alert} by {resource_group,region,name}
    ) != 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.eventhub_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.status_extra_tags)
}

resource "datadog_monitor" "eventhub_failed_requests" {
  count   = var.failed_requests_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Event Hub too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_requests_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_requests_rate_time_aggregator}(${var.failed_requests_rate_timeframe}): (
      default(avg:azure.eventhub_namespaces.failed_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(avg:azure.eventhub_namespaces.incoming_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 1)
    ) * 100 > ${var.failed_requests_rate_thresold_critical}
EOQ

  monitor_thresholds {
    critical = var.failed_requests_rate_thresold_critical
    warning  = var.failed_requests_rate_thresold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.failed_requests_rate_extra_tags)
}

resource "datadog_monitor" "eventhub_errors" {
  count   = var.errors_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Event Hub too many errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.errors_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.errors_rate_time_aggregator}(${var.errors_rate_timeframe}): ( (
      default(avg:azure.eventhub_namespaces.internal_server_errors${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.eventhub_namespaces.server_busy_errors${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.eventhub_namespaces.other_errors${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) ) /
      default(avg:azure.eventhub_namespaces.incoming_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 1)
    ) * 100 > ${var.errors_rate_thresold_critical}
EOQ

  monitor_thresholds {
    critical = var.errors_rate_thresold_critical
    warning  = var.errors_rate_thresold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.errors_rate_extra_tags)
}
