resource "datadog_monitor" "apimgt_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] API Management is down"
  message = coalesce(var.status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.status_time_aggregator}(${var.status_timeframe}):avg:azure.apimanagement_service.count${module.filter-tags.query_alert} by {resource_group,region,name} < 1
EOQ

  monitor_thresholds {
    critical = 1
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.apimgt_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:apimanagement", "team:claranet", "created-by:terraform"], var.status_extra_tags)
}

resource "datadog_monitor" "apimgt_failed_requests" {
  count   = var.failed_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] API Management too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_requests_time_aggregator}(${var.failed_requests_timeframe}): (
      default(avg:azure.apimanagement_service.failed_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 1)
    ) * 100 > ${var.failed_requests_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.failed_requests_threshold_critical
    warning  = var.failed_requests_threshold_warning
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  evaluation_delay    = var.evaluation_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  require_full_window = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:apimanagement", "team:claranet", "created-by:terraform"], var.failed_requests_extra_tags)
}

resource "datadog_monitor" "apimgt_other_requests" {
  count   = var.other_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] API Management too many other requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.other_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.other_requests_time_aggregator}(${var.other_requests_timeframe}): (
      default(avg:azure.apimanagement_service.other_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 1)
    ) * 100 > ${var.other_requests_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.other_requests_threshold_critical
    warning  = var.other_requests_threshold_warning
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  evaluation_delay    = var.evaluation_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  require_full_window = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:apimanagement", "team:claranet", "created-by:terraform"], var.other_requests_extra_tags)
}

resource "datadog_monitor" "apimgt_unauthorized_requests" {
  count   = var.unauthorized_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] API Management too many unauthorized requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.unauthorized_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.unauthorized_requests_time_aggregator}(${var.unauthorized_requests_timeframe}): (
      default(avg:azure.apimanagement_service.unauthorized_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 1)
    ) * 100 > ${var.unauthorized_requests_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.unauthorized_requests_threshold_critical
    warning  = var.unauthorized_requests_threshold_warning
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  evaluation_delay    = var.evaluation_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  require_full_window = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:apimanagement", "team:claranet", "created-by:terraform"], var.unauthorized_requests_extra_tags)
}

resource "datadog_monitor" "apimgt_successful_requests" {
  count   = var.successful_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] API Management successful requests rate too low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.successful_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.successful_requests_time_aggregator}(${var.successful_requests_timeframe}):
    default(
      avg:azure.apimanagement_service.successful_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate() /
      avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate()
      * 100
    , 100) < ${var.successful_requests_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.successful_requests_threshold_critical
    warning  = var.successful_requests_threshold_warning
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  evaluation_delay    = var.evaluation_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  require_full_window = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:apimanagement", "team:claranet", "created-by:terraform"], var.successful_requests_extra_tags)
}

