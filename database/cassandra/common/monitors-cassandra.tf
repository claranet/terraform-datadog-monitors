resource "datadog_monitor" "datadog_node_cassandra_down" {
  count   = var.cassandra_node_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra node is down"
  message = coalesce(var.cassandra_node_status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cassandra_node_time_aggregator}(${var.cassandra_node_timeframe}): (
      avg:cassandra.nodetool.status.status${module.filter-tags.query_alert} by {datacenter,node_id}
    ) < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.cassandra_node_availability_extra_tags)
}

resource "datadog_monitor" "datadog_cassandra_process_down" {
  count   = var.cassandra_process_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra process is down"
  message = coalesce(var.cassandra_process_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cassandra_process_time_aggregator}(${var.cassandra_process_timeframe}):
    min:system.processes.number${module.filter-tags-check-process.query_alert} by {host} < 1
EOQ

  thresholds = {
    critical = 1
  }

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:process", "provider:process-check", "resource:custom", "team:claranet", "created-by:terraform"], var.cassandra_process_extra_tags)
}

resource "datadog_monitor" "datadog_monitor_cassandra_read_latency" {
  count   = var.cassandra_read_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra read latency {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.cassandra_read_latency_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cassandra_read_latency_time_aggregator}(${var.cassandra_read_latency_timeframe}): (
     cassandra.read_latency.99th_percentile${module.filter-tags.query_alert} by {datacenter}) > ${var.cassandra_read_latency_threshold_critical}
EOQ

  thresholds = {
    warning  = var.cassandra_read_latency_threshold_warning
    critical = var.cassandra_read_latency_threshold_critical
  }

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.cassandra_read_latency_availability_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "datadog_monitor_cassandra_write_latency" {
  count   = var.cassandra_write_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra write latency {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.cassandra_write_latency_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cassandra_write_latency_time_aggregator}(${var.cassandra_write_latency_timeframe}): (
     cassandra.write_latency.99th_percentile${module.filter-tags.query_alert} by {datacenter}) > ${var.cassandra_write_latency_threshold_critical}
EOQ

  thresholds = {
    warning  = var.cassandra_write_latency_threshold_warning
    critical = var.cassandra_write_latency_threshold_critical
  }

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.cassandra_write_latency_availability_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "datadog_monitor_cassandra_key_cache" {
  count   = var.cassandra_key_cache_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra key cache {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cassandra_key_cache_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cassandra_key_cache_time_aggregator}(${var.cassandra_key_cache_timeframe}): (
     cassandra.key_cache_hit_rate${module.filter-tags.query_alert} by {datacenter}) < ${var.cassandra_key_cache_threshold_critical}
EOQ

  thresholds = {
    warning  = var.cassandra_key_cache_threshold_warning
    critical = var.cassandra_key_cache_threshold_critical
  }

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.cassandra_key_cache_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "datadog_monitor_cassandra_exceptions" {
  count   = var.cassandra_exceptions_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra exceptions {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cassandra_exceptions_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cassandra_exceptions_time_aggregator}(${var.cassandra_exceptions_timeframe}): (
     cassandra.exceptions.count${module.filter-tags.query_alert} by {datacenter}) > ${var.cassandra_exceptions_threshold_critical}
EOQ

  thresholds = {
    warning  = var.cassandra_exceptions_threshold_warning
    critical = var.cassandra_exceptions_threshold_critical
  }

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.cassandra_exceptions_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}
