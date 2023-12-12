# Monitoring Azure Search latency
resource "datadog_monitor" "azure_search_latency" {
  count   = var.latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Search latency too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (
      avg:azure.search_searchservices.search_latency${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.latency_threshold_warning
    critical = var.latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.azure_search_latency_no_data_timeframe
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.latency_extra_tags)
}

# Monitoring Azure Search throttled queries
resource "datadog_monitor" "azure_search_throttled_queries_rate" {
  count   = var.throttled_queries_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Search throttled queries rate is too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.throttled_queries_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.throttled_queries_rate_time_aggregator}(${var.throttled_queries_rate_timeframe}): (
      avg:azure.search_searchservices.throttled_search_queries_percentage${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.throttled_queries_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.throttled_queries_rate_threshold_warning
    critical = var.throttled_queries_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.throttled_queries_rate_extra_tags)
}

