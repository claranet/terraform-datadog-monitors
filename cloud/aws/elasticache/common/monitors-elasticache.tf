resource "datadog_monitor" "elasticache_eviction" {
  count   = var.eviction_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache eviction {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}"
  message = coalesce(var.eviction_message, var.message)
  type    = "query alert"

  query = <<EOQ
    sum(${var.eviction_timeframe}): (
      avg:aws.elasticache.evictions${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) > ${var.eviction_threshold_critical}
EOQ

  monitor_thresholds = {
    warning  = var.eviction_threshold_warning
    critical = var.eviction_threshold_critical
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache", "team:claranet", "created-by:terraform"], var.eviction_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "elasticache_max_connection" {
  count   = var.max_connection_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache max connections reached {{#is_alert}}{{{comparator}}} {{threshold}} {{/is_alert}}"
  message = coalesce(var.max_connection_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.max_connection_time_aggregator}(${var.max_connection_timeframe}): (
      avg:aws.elasticache.curr_connections${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) >= 65000
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.elasticache_max_connection_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache", "team:claranet", "created-by:terraform"], var.max_connection_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "elasticache_no_connection" {
  count   = var.no_connection_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache connections {{#is_alert}}{{{comparator}}} {{threshold}} {{/is_alert}}"
  message = coalesce(var.no_connection_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.no_connection_time_aggregator}(${var.no_connection_timeframe}): (
      avg:aws.elasticache.curr_connections${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) <= 0
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache", "team:claranet", "created-by:terraform"], var.no_connection_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "elasticache_swap" {
  count   = var.swap_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache swap {{#is_alert}}{{{comparator}}} {{threshold}}MB ({{value}}MB){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}MB ({{value}}MB){{/is_warning}}"
  message = coalesce(var.swap_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.swap_time_aggregator}(${var.swap_timeframe}): (
      avg:aws.elasticache.swap_usage${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) > ${var.swap_threshold_critical}
EOQ

  monitor_thresholds = {
    warning  = var.swap_threshold_warning
    critical = var.swap_threshold_critical
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache", "team:claranet", "created-by:terraform"], var.swap_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "elasticache_free_memory" {
  count   = var.free_memory_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache free memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.free_memory_message, var.message)
  type    = "query alert"

  query = <<EOQ
    pct_change(avg(${var.free_memory_timeframe}),${var.free_memory_condition_timeframe}):
      avg:aws.elasticache.freeable_memory${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    < ${var.free_memory_threshold_critical}
EOQ

  monitor_thresholds = {
    warning  = var.free_memory_threshold_warning
    critical = var.free_memory_threshold_critical
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache", "team:claranet", "created-by:terraform"], var.free_memory_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "elasticache_eviction_growing" {
  count   = var.eviction_growing_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache evictions is growing {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.eviction_growing_message, var.message)
  type    = "query alert"

  query = <<EOQ
    pct_change(avg(${var.eviction_growing_timeframe}),${var.eviction_growing_condition_timeframe}):
      avg:aws.elasticache.evictions${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    > ${var.eviction_growing_threshold_critical}
EOQ

  monitor_thresholds = {
    warning  = var.eviction_growing_threshold_warning
    critical = var.eviction_growing_threshold_critical
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache", "team:claranet", "created-by:terraform"], var.eviction_growing_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

