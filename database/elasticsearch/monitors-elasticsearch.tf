#
# Service Check
#
resource "datadog_monitor" "not_responding" {
  count   = var.not_responding_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch does not respond"
  message = coalesce(var.not_responding_message, var.message)
  type    = "service check"

  query = <<EOQ
    "elasticsearch.can_connect"${module.filter-tags.service_check}.by("server","port").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.not_responding_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.not_responding_no_data_timeframe
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.not_responding_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Cluster Status Not Green
#
resource "datadog_monitor" "cluster_status_not_green" {
  count   = var.cluster_status_not_green_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch Cluster status not green"
  message = coalesce(var.cluster_status_not_green_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_status_not_green_time_aggregator}(${var.cluster_status_not_green_timeframe}):
    min:elasticsearch.cluster_status${module.filter-tags.query_alert} by {cluster_name}
  <= ${var.cluster_status_not_green_threshold_critical}
EOQ

  monitor_thresholds {
    # ok = 2
    warning  = var.cluster_status_not_green_threshold_warning  # Yellow
    critical = var.cluster_status_not_green_threshold_critical # Red
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.cluster_status_not_green_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Cluster Initializing Shards
#
resource "datadog_monitor" "cluster_initializing_shards" {
  count   = var.cluster_initializing_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch Cluster is initializing shards"
  message = coalesce(var.cluster_initializing_shards_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_initializing_shards_time_aggregator}(${var.cluster_initializing_shards_timeframe}):
    avg:elasticsearch.initializing_shards${module.filter-tags.query_alert} by {cluster_name}
  > ${var.cluster_initializing_shards_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cluster_initializing_shards_threshold_warning
    critical = var.cluster_initializing_shards_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.cluster_initializing_shards_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Cluster Relocating Shards
#
resource "datadog_monitor" "cluster_relocating_shards" {
  count   = var.cluster_relocating_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch Cluster is relocating shards"
  message = coalesce(var.cluster_relocating_shards_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_relocating_shards_time_aggregator}(${var.cluster_relocating_shards_timeframe}):
    avg:elasticsearch.relocating_shards${module.filter-tags.query_alert} by {cluster_name}
  > ${var.cluster_relocating_shards_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cluster_relocating_shards_threshold_warning
    critical = var.cluster_relocating_shards_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.cluster_relocating_shards_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Cluster Unassigned Shards
#
resource "datadog_monitor" "cluster_unassigned_shards" {
  count   = var.cluster_unassigned_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch Cluster has unassigned shards"
  message = coalesce(var.cluster_unassigned_shards_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_unassigned_shards_time_aggregator}(${var.cluster_unassigned_shards_timeframe}):
    avg:elasticsearch.unassigned_shards${module.filter-tags.query_alert} by {cluster_name}
  > ${var.cluster_unassigned_shards_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cluster_unassigned_shards_threshold_warning
    critical = var.cluster_unassigned_shards_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.cluster_unassigned_shards_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Free Space in nodes
#
resource "datadog_monitor" "node_free_space" {
  count   = var.node_free_space_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch free space < 10%"
  message = coalesce(var.node_free_space_message, var.message)

  type = "query alert"

  query = <<EOQ
  ${var.node_free_space_time_aggregator}(${var.node_free_space_timeframe}):
    (min:elasticsearch.fs.total.available_in_bytes${module.filter-tags.query_alert} by {node_name}
    /
    min:elasticsearch.fs.total.total_in_bytes${module.filter-tags.query_alert} by {node_name}
    ) * 100
  < ${var.node_free_space_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.node_free_space_threshold_warning
    critical = var.node_free_space_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.node_free_space_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# JVM Heap Memory Usage
#
resource "datadog_monitor" "jvm_heap_memory_usage" {
  count   = var.jvm_heap_memory_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch JVM HEAP memory usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_heap_memory_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_heap_memory_usage_time_aggregator}(${var.jvm_heap_memory_usage_timeframe}):
    avg:jvm.mem.heap_in_use${module.filter-tags.query_alert} by {node_name}
  > ${var.jvm_heap_memory_usage_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.jvm_heap_memory_usage_threshold_warning
    critical = var.jvm_heap_memory_usage_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.jvm_heap_memory_usage_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# JVM Memory Young Usage
#
resource "datadog_monitor" "jvm_memory_young_usage" {
  count   = var.jvm_memory_young_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch JVM memory Young usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_memory_young_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_memory_young_usage_time_aggregator}(${var.jvm_memory_young_usage_timeframe}):
    avg:jvm.mem.pools.young.used${module.filter-tags.query_alert} by {node_name} / avg:jvm.mem.pools.young.max${module.filter-tags.query_alert} by {node_name} * 100
  > ${var.jvm_memory_young_usage_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.jvm_memory_young_usage_threshold_warning
    critical = var.jvm_memory_young_usage_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.jvm_memory_young_usage_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# JVM Memory Old Usage
#
resource "datadog_monitor" "jvm_memory_old_usage" {
  count   = var.jvm_memory_old_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch JVM memory Old usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_memory_old_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_memory_old_usage_time_aggregator}(${var.jvm_memory_old_usage_timeframe}):
    avg:jvm.mem.pools.old.used${module.filter-tags.query_alert} by {node_name} / avg:jvm.mem.pools.old.max${module.filter-tags.query_alert} by {node_name} * 100
  > ${var.jvm_memory_old_usage_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.jvm_memory_old_usage_threshold_warning
    critical = var.jvm_memory_old_usage_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.jvm_memory_old_usage_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# JVM Garbace Collector Old Collection Latency
#
resource "datadog_monitor" "jvm_gc_old_collection_latency" {
  count   = var.jvm_gc_old_collection_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch average Old-generation garbage collections latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.jvm_gc_old_collection_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_gc_old_collection_latency_time_aggregator}(${var.jvm_gc_old_collection_latency_timeframe}):
    default(
      diff(avg:jvm.gc.collectors.old.collection_time${module.filter-tags.query_alert} by {node_name}) /
      diff(avg:jvm.gc.collectors.old.count${module.filter-tags.query_alert} by {node_name})
    * 1000, 0)
  > ${var.jvm_gc_old_collection_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.jvm_gc_old_collection_latency_threshold_warning
    critical = var.jvm_gc_old_collection_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.jvm_gc_old_collection_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# JVM Garbace Collector Young Collection Latency
#
resource "datadog_monitor" "jvm_gc_young_collection_latency" {
  count   = var.jvm_gc_young_collection_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch average Young-generation garbage collections latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.jvm_gc_young_collection_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_gc_young_collection_latency_time_aggregator}(${var.jvm_gc_young_collection_latency_timeframe}):
    default(
      diff(avg:jvm.gc.collectors.young.collection_time${module.filter-tags.query_alert} by {node_name}) /
      diff(avg:jvm.gc.collectors.young.count${module.filter-tags.query_alert} by {node_name})
    * 1000, 0)
  > ${var.jvm_gc_young_collection_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.jvm_gc_young_collection_latency_threshold_warning
    critical = var.jvm_gc_young_collection_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.jvm_gc_young_collection_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Indexing Latency
#
resource "datadog_monitor" "indexing_latency" {
  count   = var.indexing_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch average indexing latency by document {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.indexing_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.indexing_latency_time_aggregator}(${var.indexing_latency_timeframe}):
    default(
      diff(avg:elasticsearch.indexing.index.time${module.filter-tags.query_alert} by {node_name}) /
      diff(avg:elasticsearch.indexing.index.total${module.filter-tags.query_alert} by {node_name})
    * 1000, 0)
   > ${var.indexing_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.indexing_latency_threshold_warning
    critical = var.indexing_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.indexing_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Flush Latency
#
resource "datadog_monitor" "flush_latency" {
  count   = var.flush_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch average index flushing to disk latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.flush_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.flush_latency_time_aggregator}(${var.flush_latency_timeframe}):
    default(
      diff(avg:elasticsearch.flush.total.time${module.filter-tags.query_alert} by {node_name}) /
      diff(avg:elasticsearch.flush.total${module.filter-tags.query_alert} by {node_name})
    * 1000, 0)
  > ${var.flush_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.flush_latency_threshold_warning
    critical = var.flush_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.flush_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Open HTTP Connections Anomaly
#
resource "datadog_monitor" "http_connections_anomaly" {
  count   = var.http_connections_anomaly_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch number of current open HTTP connections anomaly detected"
  message = coalesce(var.http_connections_anomaly_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.http_connections_anomaly_time_aggregator}(${var.http_connections_anomaly_timeframe}):
    anomalies(avg:elasticsearch.http.current_open${module.filter-tags.query_alert} by {node_name},
              '${var.http_connections_anomaly_detection_algorithm}',
              ${var.http_connections_anomaly_deviations},
              direction='${var.http_connections_anomaly_direction}',
              alert_window='${var.http_connections_anomaly_alert_window}',
              interval=${var.http_connections_anomaly_interval},
              count_default_zero='${var.http_connections_anomaly_count_default_zero}',
              seasonality='${var.http_connections_anomaly_seasonality}'
              )
  >= ${var.http_connections_anomaly_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.http_connections_anomaly_threshold_warning
    critical = var.http_connections_anomaly_threshold_critical
  }

  threshold_windows = {
    trigger_window  = var.http_connections_anomaly_alert_window
    recovery_window = var.http_connections_anomaly_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.http_connections_anomaly_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Query Latency
#
resource "datadog_monitor" "search_query_latency" {
  count   = var.search_query_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch average search query latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.search_query_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.search_query_latency_time_aggregator}(${var.search_query_latency_timeframe}):
    default(
      diff(avg:elasticsearch.search.query.time${module.filter-tags.query_alert} by {node_name}) /
      diff(avg:elasticsearch.search.query.total${module.filter-tags.query_alert} by {node_name})
    * 1000, 0)
  > ${var.search_query_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.search_query_latency_threshold_warning
    critical = var.search_query_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.search_query_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Fetch Latency
#
resource "datadog_monitor" "fetch_latency" {
  count   = var.fetch_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch average search fetch latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.fetch_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.fetch_latency_time_aggregator}(${var.fetch_latency_timeframe}):
    default(
      diff(avg:elasticsearch.search.fetch.time${module.filter-tags.query_alert} by {node_name}) /
      diff(avg:elasticsearch.search.fetch.total${module.filter-tags.query_alert} by {node_name})
    * 1000, 0)
  > ${var.fetch_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.fetch_latency_threshold_warning
    critical = var.fetch_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.fetch_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Search Query Change
#
resource "datadog_monitor" "search_query_change" {
  count   = var.search_query_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch change alert on the number of currently active queries"
  message = coalesce(var.search_query_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.search_query_change_time_aggregator}(${var.search_query_change_timeframe}),${var.search_query_change_timeshift}):
    avg:elasticsearch.search.query.current${module.filter-tags.query_alert} by {cluster_name}
  >= ${var.search_query_change_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.search_query_change_threshold_warning
    critical = var.search_query_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.search_query_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Fetch Change
#
resource "datadog_monitor" "fetch_change" {
  count   = var.fetch_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch change alert on the number of search fetches currently running"
  message = coalesce(var.fetch_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.fetch_change_time_aggregator}(${var.fetch_change_timeframe}),${var.fetch_change_timeshift}):
    avg:elasticsearch.search.fetch.current${module.filter-tags.query_alert} by {cluster_name}
  >= ${var.fetch_change_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.fetch_change_threshold_warning
    critical = var.fetch_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.fetch_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Field Data Evictions
#
resource "datadog_monitor" "field_data_evictions_change" {
  count   = var.field_data_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch change alert on the total number of evictions from the fielddata cache"
  message = coalesce(var.field_data_evictions_change_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.field_data_evictions_change_time_aggregator}(${var.field_data_evictions_change_timeframe}),${var.field_data_evictions_change_timeshift}):
    avg:elasticsearch.fielddata.evictions${module.filter-tags.query_alert} by {node_name}
  > ${var.field_data_evictions_change_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.field_data_evictions_change_threshold_warning
    critical = var.field_data_evictions_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.field_data_evictions_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Query Cache Evictions
#
resource "datadog_monitor" "query_cache_evictions_change" {
  count   = var.query_cache_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch change alert on the number of query cache evictions"
  message = coalesce(var.query_cache_evictions_change_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.query_cache_evictions_change_time_aggregator}(${var.query_cache_evictions_change_timeframe}),${var.query_cache_evictions_change_timeshift}):
    avg:elasticsearch.indices.query_cache.evictions${module.filter-tags.query_alert} by {node_name}
  > ${var.query_cache_evictions_change_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.query_cache_evictions_change_threshold_warning
    critical = var.query_cache_evictions_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.query_cache_evictions_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Request Cache Evictions
#
resource "datadog_monitor" "request_cache_evictions_change" {
  count   = var.request_cache_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch change alert on the number of request cache evictions"
  message = coalesce(var.request_cache_evictions_change_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.request_cache_evictions_change_time_aggregator}(${var.request_cache_evictions_change_timeframe}),${var.request_cache_evictions_change_timeshift}):
    avg:elasticsearch.indices.request_cache.evictions${module.filter-tags.query_alert} by {node_name}
  > ${var.request_cache_evictions_change_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.request_cache_evictions_change_threshold_warning
    critical = var.request_cache_evictions_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.request_cache_evictions_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Task Time in Queue
#
resource "datadog_monitor" "task_time_in_queue_change" {
  count   = var.task_time_in_queue_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticsearch change alert on the average time spent by tasks in the queue"
  message = coalesce(var.task_time_in_queue_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  change(${var.task_time_in_queue_change_time_aggregator}(${var.task_time_in_queue_change_timeframe}),${var.task_time_in_queue_change_timeshift}):
    avg:elasticsearch.pending_tasks_time_in_queue${module.filter-tags.query_alert} by {cluster_name}
  > ${var.task_time_in_queue_change_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.task_time_in_queue_change_threshold_warning
    critical = var.task_time_in_queue_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:elasticsearch", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.task_time_in_queue_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

