# Monitoring Front Door status
resource "datadog_monitor" "frontdoor_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Front Door is down"
  message = coalesce(var.status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
       avg:azure.network_frontdoors.count${module.filter-tags.query_alert} by {resource_group,region,name}
    ) != 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.frontdoor_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:frontdoor", "team:claranet", "created-by:terraform"], var.status_extra_tags)
}

# Monitoring Front Door backend request latency
resource "datadog_monitor" "frontdoor_backend_request_latency" {
  count   = var.frontdoor_backend_request_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Front Door backend request latency is too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.frontdoor_backend_request_latency_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.frontdoor_backend_request_latency_time_aggregator}(${var.frontdoor_backend_request_latency_timeframe}): 
      avg:azure.network_frontdoors.backend_request_latency${module.filter-tags.query_alert} by {resource_group,region,name}
      > ${var.frontdoor_backend_request_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.frontdoor_backend_request_latency_threshold_critical
    warning  = var.frontdoor_backend_request_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:frontdoor", "team:claranet", "created-by:terraform"], var.frontdoor_backend_request_latency_extra_tags)
}

# Monitoring Front Door total latency
resource "datadog_monitor" "frontdoor_total_latency" {
  count   = var.frontdoor_total_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Front Door total latency is too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.frontdoor_total_latency_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.frontdoor_total_latency_time_aggregator}(${var.frontdoor_total_latency_timeframe}): 
      avg:azure.network_frontdoors.total_latency${module.filter-tags.query_alert} by {resource_group,region,name}
      > ${var.frontdoor_total_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.frontdoor_total_latency_threshold_critical
    warning  = var.frontdoor_total_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:frontdoor", "team:claranet", "created-by:terraform"], var.frontdoor_total_latency_extra_tags)
}

# Monitoring Front Door request count
resource "datadog_monitor" "frontdoor_request_count" {
  count   = var.frontdoor_request_count_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Front Door has no requests"
  message = coalesce(var.frontdoor_request_count_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.frontdoor_request_count_time_aggregator}(${var.frontdoor_request_count_timeframe}): 
      sum:azure.network_frontdoors.request_count${module.filter-tags.query_alert} by {resource_group,region,name}
      < 1
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:frontdoor", "team:claranet", "created-by:terraform"], var.frontdoor_request_count_extra_tags)
}

# Monitoring Front Door backend health
resource "datadog_monitor" "frontdoor_backend_health" {
  count   = var.frontdoor_backend_health_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Front Door backend health is too low {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.frontdoor_backend_health_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.frontdoor_backend_health_time_aggregator}(${var.frontdoor_backend_health_timeframe}): 
      avg:azure.network_frontdoors.backend_health_percentage${module.filter-tags.query_alert} by {resource_group,region,name}
      < ${var.frontdoor_backend_health_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.frontdoor_backend_health_threshold_critical
    warning  = var.frontdoor_backend_health_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:frontdoor", "team:claranet", "created-by:terraform"], var.frontdoor_backend_health_extra_tags)
}
