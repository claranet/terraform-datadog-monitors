resource "datadog_monitor" "elasticache_eviction" {
  name    = "[${var.environment}] Elasticache eviction {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}"
  message = "${coalesce(var.eviction_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.eviction_time_aggregator}(${var.eviction_timeframe}): (
      avg:aws.elasticache.evictions{${var.filter_tags}} by {region,cacheclusterid}
    ) > 0
  EOF

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.eviction_silenced}"

  tags = ["env:${var.environment}", "engine:${var.resource}", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "elasticache_max_connection" {
  name    = "[${var.environment}] Elasticache max connections reached {{#is_alert}}{{{comparator}}} {{threshold}} {{/is_alert}}"
  message = "${coalesce(var.max_connection_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.max_connection_time_aggregator}(${var.max_connection_timeframe}): (
      avg:aws.elasticache.curr_connections{${var.filter_tags}} by {region,cacheclusterid}
    ) >= 65000
  EOF

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.max_connection_silenced}"

  tags = ["env:${var.environment}", "engine:${var.resource}", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "elasticache_no_connection" {
  name    = "[${var.environment}] Elasticache connections {{#is_alert}}{{{comparator}}} {{threshold}} {{/is_alert}}"
  message = "${coalesce(var.no_connection_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.no_connection_time_aggregator}(${var.no_connection_timeframe}): (
      avg:aws.elasticache.curr_connections{${var.filter_tags}} by {region,cacheclusterid}
    ) <= 0
  EOF

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.no_connection_silenced}"

  tags = ["env:${var.environment}", "engine:${var.resource}", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "elasticache_swap" {
  name    = "[${var.environment}] Elasticache swap {{#is_alert}}{{{comparator}}} {{threshold}}MB ({{value}}MB){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}MB ({{value}}MB){{/is_warning}}"
  message = "${coalesce(var.swap_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.swap_time_aggregator}(${var.swap_timeframe}): (
      avg:aws.elasticache.swap_usage{${var.filter_tags}} by {region,cacheclusterid}
    ) > ${var.swap_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.swap_threshold_warning}"
    critical = "${var.swap_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.swap_silenced}"

  tags = ["env:${var.environment}", "engine:${var.resource}", "team:aws", "provider:aws"]
}

# POC - A approfondir
resource "datadog_monitor" "elasticache_free_memory" {
  name    = "[${var.environment}] Elasticache free memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_memory_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    pct_change(avg(${var.free_memory_timeframe}),${var.free_memory_condition_timeframe}):
      avg:aws.elasticache.freeable_memory{${var.filter_tags}} by {region,cacheclusterid,cachenodeid}
    < ${var.free_memory_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.free_memory_threshold_warning}"
    critical = "${var.free_memory_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.free_memory_silenced}"

  tags = ["env:${var.environment}", "engine:${var.resource}", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "elasticache_eviction_growing" {
  name    = "[${var.environment}] Elasticache evictions is growing {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.eviction_growing_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    pct_change(avg(${var.eviction_growing_timeframe}),${var.eviction_growing_condition_timeframe}):
      avg:aws.elasticache.evictions{${var.filter_tags}} by {region,cacheclusterid}
    > ${var.eviction_growing_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.eviction_growing_threshold_warning}"
    critical = "${var.eviction_growing_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.eviction_growing_silenced}"

  tags = ["env:${var.environment}", "engine:${var.resource}", "team:aws", "provider:aws"]
}
