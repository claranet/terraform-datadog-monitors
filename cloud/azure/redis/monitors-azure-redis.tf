resource "datadog_monitor" "status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis {{name}} is down"
  message = coalesce(var.status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.cache_redis.count${module.filter-tags.query_alert} by {resource_group,region,name}
    ) != 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.status_extra_tags)
}

resource "datadog_monitor" "evictedkeys" {
  count   = var.evictedkeys_limit_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis too many evictedkeys {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.evictedkeys_limit_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.evictedkeys_limit_time_aggregator}(${var.evictedkeys_limit_timeframe}): (
      avg:azure.cache_redis.evictedkeys${module.filter-tags.query_alert} by {resource_group,region,name}
     ) > ${var.evictedkeys_limit_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.evictedkeys_limit_threshold_warning
    critical = var.evictedkeys_limit_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.evictedkeys_limit_extra_tags)
}

resource "datadog_monitor" "percent_processor_time" {
  count   = var.percent_processor_time_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis processor time too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.percent_processor_time_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.percent_processor_time_time_aggregator}(${var.percent_processor_time_timeframe}): (
      avg:azure.cache_redis.percent_processor_time${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.percent_processor_time_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.percent_processor_time_threshold_warning
    critical = var.percent_processor_time_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.percent_processor_time_extra_tags)
}

resource "datadog_monitor" "server_load" {
  count   = var.server_load_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis server load too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.server_load_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.server_load_rate_time_aggregator}(${var.server_load_rate_timeframe}): (
      avg:azure.cache_redis.server_load${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.server_load_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.server_load_rate_threshold_warning
    critical = var.server_load_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.server_load_rate_extra_tags)
}

