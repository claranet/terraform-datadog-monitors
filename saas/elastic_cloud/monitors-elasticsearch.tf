#
# Cluster Status Not Green
#
resource "datadog_monitor" "cluster_status_not_green_yellow" {
  count   = var.cluster_status_not_green_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster status is yellow"
  message = coalesce(var.cluster_status_not_green_message, var.message_warning)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_status_not_green_time_aggregator}(${var.cluster_status_not_green_timeframe}):
    min:elastic_cloud.cluster_status${module.filter-tags.query_alert} by {deployment_name}
  <= ${var.cluster_status_not_green_threshold_warning}
EOQ

  monitor_thresholds {
    # ok = 2
    critical = var.cluster_status_not_green_threshold_warning # Yellow
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_status_not_green_extra_tags)
}

resource "datadog_monitor" "cluster_status_not_green_red" {
  count   = var.cluster_status_not_green_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster status is red"
  message = coalesce(var.cluster_status_not_green_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_status_not_green_time_aggregator}(${var.cluster_status_not_green_timeframe}):
    min:elastic_cloud.cluster_status${module.filter-tags.query_alert} by {deployment_name}
  <= ${var.cluster_status_not_green_threshold_critical}
EOQ

  monitor_thresholds {
    # ok = 2
    critical = var.cluster_status_not_green_threshold_critical # Red
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_status_not_green_extra_tags)
}

#
# Cluster Initializing Shards
#
resource "datadog_monitor" "cluster_initializing_shards" {
  count   = var.cluster_initializing_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster is initializing shards"
  message = coalesce(var.cluster_initializing_shards_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_initializing_shards_time_aggregator}(${var.cluster_initializing_shards_timeframe}):
    avg:elastic_cloud.initializing_shards${module.filter-tags.query_alert} by {deployment_name}
  > ${var.cluster_initializing_shards_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cluster_initializing_shards_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_initializing_shards_extra_tags)
}

resource "datadog_monitor" "cluster_initializing_shards_warning" {
  count   = var.cluster_initializing_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster is initializing shards"
  message = coalesce(var.cluster_initializing_shards_message, var.message_warning)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_initializing_shards_time_aggregator}(${var.cluster_initializing_shards_timeframe}):
    avg:elastic_cloud.initializing_shards${module.filter-tags.query_alert} by {deployment_name}
  > ${var.cluster_initializing_shards_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.cluster_initializing_shards_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_initializing_shards_extra_tags)
}

#
# Cluster Relocating Shards
#
resource "datadog_monitor" "cluster_relocating_shards" {
  count   = var.cluster_relocating_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster is relocating shards"
  message = coalesce(var.cluster_relocating_shards_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_relocating_shards_time_aggregator}(${var.cluster_relocating_shards_timeframe}):
    avg:elastic_cloud.relocating_shards${module.filter-tags.query_alert} by {deployment_name}
  > ${var.cluster_relocating_shards_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cluster_relocating_shards_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_relocating_shards_extra_tags)
}

resource "datadog_monitor" "cluster_relocating_shards_warning" {
  count   = var.cluster_relocating_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster is relocating shards"
  message = coalesce(var.cluster_relocating_shards_message, var.message_warning)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_relocating_shards_time_aggregator}(${var.cluster_relocating_shards_timeframe}):
    avg:elastic_cloud.relocating_shards${module.filter-tags.query_alert} by {deployment_name}
  > ${var.cluster_relocating_shards_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.cluster_relocating_shards_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_relocating_shards_extra_tags)
}

#
# Cluster Unassigned Shards
#
resource "datadog_monitor" "cluster_unassigned_shards" {
  count   = var.cluster_unassigned_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster has unassigned shards"
  message = coalesce(var.cluster_unassigned_shards_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_unassigned_shards_time_aggregator}(${var.cluster_unassigned_shards_timeframe}):
    avg:elastic_cloud.unassigned_shards${module.filter-tags.query_alert} by {deployment_name}
  > ${var.cluster_unassigned_shards_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cluster_unassigned_shards_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_unassigned_shards_extra_tags)
}

resource "datadog_monitor" "cluster_unassigned_shards_warning" {
  count   = var.cluster_unassigned_shards_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch Cluster has unassigned shards"
  message = coalesce(var.cluster_unassigned_shards_message, var.message_warning)
  type    = "metric alert"

  query = <<EOQ
  ${var.cluster_unassigned_shards_time_aggregator}(${var.cluster_unassigned_shards_timeframe}):
    avg:elastic_cloud.unassigned_shards${module.filter-tags.query_alert} by {deployment_name}
  > ${var.cluster_unassigned_shards_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.cluster_unassigned_shards_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.cluster_unassigned_shards_extra_tags)
}

#
# Free Space in nodes
#
resource "datadog_monitor" "node_free_space" {
  count   = var.node_free_space_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch free space < 10%"
  message = coalesce(var.node_free_space_message, var.message)

  type = "query alert"

  query = <<EOQ
  ${var.node_free_space_time_aggregator}(${var.node_free_space_timeframe}):
    (min:elastic_cloud.fs.total.available_in_bytes${module.filter-tags.query_alert} by {deployment_name,node_name}
    /
    min:elastic_cloud.fs.total.total_in_bytes${module.filter-tags.query_alert} by {deployment_name,node_name}
    ) * 100
  < ${var.node_free_space_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.node_free_space_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.node_free_space_extra_tags)
}

resource "datadog_monitor" "node_free_space_warning" {
  count   = var.node_free_space_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] ElasticSearch free space < 20%"
  message = coalesce(var.node_free_space_message, var.message_warning)

  type = "query alert"

  query = <<EOQ
  ${var.node_free_space_time_aggregator}(${var.node_free_space_timeframe}):
    (min:elastic_cloud.fs.total.available_in_bytes${module.filter-tags.query_alert} by {deployment_name,node_name}
    /
    min:elastic_cloud.fs.total.total_in_bytes${module.filter-tags.query_alert} by {deployment_name,node_name}
    ) * 100
  < ${var.node_free_space_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.node_free_space_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.node_free_space_extra_tags)
}

#
# JVM Heap Memory Usage
#
resource "datadog_monitor" "jvm_heap_memory_usage" {
  count   = var.jvm_heap_memory_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch JVM HEAP memory usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_heap_memory_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_heap_memory_usage_time_aggregator}(${var.jvm_heap_memory_usage_timeframe}):
    avg:elastic_cloud.jvm.mem.heap_in_use${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.jvm_heap_memory_usage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.jvm_heap_memory_usage_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_heap_memory_usage_extra_tags)
}

resource "datadog_monitor" "jvm_heap_memory_usage_warning" {
  count   = var.jvm_heap_memory_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch JVM HEAP memory usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_heap_memory_usage_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_heap_memory_usage_time_aggregator}(${var.jvm_heap_memory_usage_timeframe}):
    avg:elastic_cloud.jvm.mem.heap_in_use${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.jvm_heap_memory_usage_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.jvm_heap_memory_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_heap_memory_usage_extra_tags)
}

#
# JVM Memory Young Usage
#
resource "datadog_monitor" "jvm_memory_young_usage" {
  count   = var.jvm_memory_young_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch JVM memory Young usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_memory_young_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_memory_young_usage_time_aggregator}(${var.jvm_memory_young_usage_timeframe}):
    avg:elastic_cloud.jvm.mem.pools.young.used${module.filter-tags.query_alert} by {deployment_name,node_name} / avg:elastic_cloud.jvm.mem.pools.young.max${module.filter-tags.query_alert} by {deployment_name,node_name} * 100
  > ${var.jvm_memory_young_usage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.jvm_memory_young_usage_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_memory_young_usage_extra_tags)
}

resource "datadog_monitor" "jvm_memory_young_usage_warning" {
  count   = var.jvm_memory_young_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch JVM memory Young usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_memory_young_usage_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_memory_young_usage_time_aggregator}(${var.jvm_memory_young_usage_timeframe}):
    avg:elastic_cloud.jvm.mem.pools.young.used${module.filter-tags.query_alert} by {deployment_name,node_name} / avg:elastic_cloud.jvm.mem.pools.young.max${module.filter-tags.query_alert} by {deployment_name,node_name} * 100
  > ${var.jvm_memory_young_usage_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.jvm_memory_young_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_memory_young_usage_extra_tags)
}

#
# JVM Memory Old Usage
#
resource "datadog_monitor" "jvm_memory_old_usage" {
  count   = var.jvm_memory_old_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch JVM memory Old usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_memory_old_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_memory_old_usage_time_aggregator}(${var.jvm_memory_old_usage_timeframe}):
    avg:elastic_cloud.jvm.mem.pools.old.used${module.filter-tags.query_alert} by {deployment_name,node_name} / avg:elastic_cloud.jvm.mem.pools.old.max${module.filter-tags.query_alert} by {deployment_name,node_name} * 100
  > ${var.jvm_memory_old_usage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.jvm_memory_old_usage_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_memory_old_usage_extra_tags)
}

resource "datadog_monitor" "jvm_memory_old_usage_warning" {
  count   = var.jvm_memory_old_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch JVM memory Old usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.jvm_memory_old_usage_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_memory_old_usage_time_aggregator}(${var.jvm_memory_old_usage_timeframe}):
    avg:elastic_cloud.jvm.mem.pools.old.used${module.filter-tags.query_alert} by {deployment_name,node_name} / avg:elastic_cloud.jvm.mem.pools.old.max${module.filter-tags.query_alert} by {deployment_name,node_name} * 100
  > ${var.jvm_memory_old_usage_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.jvm_memory_old_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_memory_old_usage_extra_tags)
}

#
# JVM Garbace Collector Old Collection Latency
#
resource "datadog_monitor" "jvm_gc_old_collection_latency" {
  count   = var.jvm_gc_old_collection_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average Old-generation garbage collections latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.jvm_gc_old_collection_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_gc_old_collection_latency_time_aggregator}(${var.jvm_gc_old_collection_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.jvm.gc.collectors.old.collection_time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.jvm.gc.collectors.old.count${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.jvm_gc_old_collection_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.jvm_gc_old_collection_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_gc_old_collection_latency_extra_tags)
}

resource "datadog_monitor" "jvm_gc_old_collection_latency_warning" {
  count   = var.jvm_gc_old_collection_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average Old-generation garbage collections latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.jvm_gc_old_collection_latency_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_gc_old_collection_latency_time_aggregator}(${var.jvm_gc_old_collection_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.jvm.gc.collectors.old.collection_time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.jvm.gc.collectors.old.count${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.jvm_gc_old_collection_latency_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.jvm_gc_old_collection_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_gc_old_collection_latency_extra_tags)
}

#
# JVM Garbace Collector Young Collection Latency
#
resource "datadog_monitor" "jvm_gc_young_collection_latency" {
  count   = var.jvm_gc_young_collection_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average Young-generation garbage collections latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.jvm_gc_young_collection_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_gc_young_collection_latency_time_aggregator}(${var.jvm_gc_young_collection_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.jvm.gc.collectors.young.collection_time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.jvm.gc.collectors.young.count${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.jvm_gc_young_collection_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.jvm_gc_young_collection_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_gc_young_collection_latency_extra_tags)
}

resource "datadog_monitor" "jvm_gc_young_collection_latency_warning" {
  count   = var.jvm_gc_young_collection_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average Young-generation garbage collections latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.jvm_gc_young_collection_latency_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  ${var.jvm_gc_young_collection_latency_time_aggregator}(${var.jvm_gc_young_collection_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.jvm.gc.collectors.young.collection_time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.jvm.gc.collectors.young.count${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.jvm_gc_young_collection_latency_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.jvm_gc_young_collection_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.jvm_gc_young_collection_latency_extra_tags)
}

#
# Indexing Latency
#
resource "datadog_monitor" "indexing_latency" {
  count   = var.indexing_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average indexing latency by document {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.indexing_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.indexing_latency_time_aggregator}(${var.indexing_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.indexing.index.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.indexing.index.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
   > ${var.indexing_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.indexing_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.indexing_latency_extra_tags)
}

resource "datadog_monitor" "indexing_latency_warning" {
  count   = var.indexing_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average indexing latency by document {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.indexing_latency_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.indexing_latency_time_aggregator}(${var.indexing_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.indexing.index.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.indexing.index.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
   > ${var.indexing_latency_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.indexing_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.indexing_latency_extra_tags)
}

#
# Flush Latency
#
resource "datadog_monitor" "flush_latency" {
  count   = var.flush_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average index flushing to disk latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.flush_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.flush_latency_time_aggregator}(${var.flush_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.flush.total.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.flush.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.flush_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.flush_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.flush_latency_extra_tags)
}

resource "datadog_monitor" "flush_latency_warning" {
  count   = var.flush_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average index flushing to disk latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.flush_latency_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.flush_latency_time_aggregator}(${var.flush_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.flush.total.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.flush.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.flush_latency_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.flush_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.flush_latency_extra_tags)
}

#
# Open HTTP Connections Anomaly
#
resource "datadog_monitor" "http_connections_anomaly" {
  count   = var.http_connections_anomaly_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch number of current open HTTP connections anomaly detected"
  message = coalesce(var.http_connections_anomaly_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.http_connections_anomaly_time_aggregator}(${var.http_connections_anomaly_timeframe}):
    anomalies(avg:elastic_cloud.http.current_open${module.filter-tags.query_alert} by {deployment_name,node_name},
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
    critical = var.http_connections_anomaly_threshold_critical
  }

  monitor_threshold_windows {
    trigger_window  = var.http_connections_anomaly_alert_window
    recovery_window = var.http_connections_anomaly_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.http_connections_anomaly_extra_tags)
}

resource "datadog_monitor" "http_connections_anomaly_warning" {
  count   = var.http_connections_anomaly_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch number of current open HTTP connections anomaly detected"
  message = coalesce(var.http_connections_anomaly_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  ${var.http_connections_anomaly_time_aggregator}(${var.http_connections_anomaly_timeframe}):
    anomalies(avg:elastic_cloud.http.current_open${module.filter-tags.query_alert} by {deployment_name,node_name},
              '${var.http_connections_anomaly_detection_algorithm}',
              ${var.http_connections_anomaly_deviations},
              direction='${var.http_connections_anomaly_direction}',
              alert_window='${var.http_connections_anomaly_alert_window}',
              interval=${var.http_connections_anomaly_interval},
              count_default_zero='${var.http_connections_anomaly_count_default_zero}',
              seasonality='${var.http_connections_anomaly_seasonality}'
              )
  >= ${var.http_connections_anomaly_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.http_connections_anomaly_threshold_warning
  }

  monitor_threshold_windows {
    trigger_window  = var.http_connections_anomaly_alert_window
    recovery_window = var.http_connections_anomaly_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.http_connections_anomaly_extra_tags)
}

#
# Query Latency
#
resource "datadog_monitor" "search_query_latency" {
  count   = var.search_query_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average search query latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.search_query_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.search_query_latency_time_aggregator}(${var.search_query_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.search.query.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.search.query.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.search_query_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.search_query_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.search_query_latency_extra_tags)
}

resource "datadog_monitor" "search_query_latency_warning" {
  count   = var.search_query_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average search query latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.search_query_latency_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.search_query_latency_time_aggregator}(${var.search_query_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.search.query.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.search.query.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.search_query_latency_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.search_query_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.search_query_latency_extra_tags)
}

#
# Fetch Latency
#
resource "datadog_monitor" "fetch_latency" {
  count   = var.fetch_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average search fetch latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.fetch_latency_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.fetch_latency_time_aggregator}(${var.fetch_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.search.fetch.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.search.fetch.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.fetch_latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.fetch_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.fetch_latency_extra_tags)
}

resource "datadog_monitor" "fetch_latency_warning" {
  count   = var.fetch_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch average search fetch latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.fetch_latency_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  ${var.fetch_latency_time_aggregator}(${var.fetch_latency_timeframe}):
    default(
      diff(avg:elastic_cloud.search.fetch.time${module.filter-tags.query_alert} by {deployment_name,node_name}) /
      diff(avg:elastic_cloud.search.fetch.total${module.filter-tags.query_alert} by {deployment_name,node_name})
    * 1000, 0)
  > ${var.fetch_latency_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.fetch_latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.fetch_latency_extra_tags)
}

#
# Search Query Change
#
resource "datadog_monitor" "search_query_change" {
  count   = var.search_query_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of currently active queries"
  message = coalesce(var.search_query_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.search_query_change_time_aggregator}(${var.search_query_change_timeframe}),${var.search_query_change_timeshift}):
    avg:elastic_cloud.search.query.current${module.filter-tags.query_alert} by {deployment_name}
  >= ${var.search_query_change_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.search_query_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.search_query_change_extra_tags)
}

resource "datadog_monitor" "search_query_change_warning" {
  count   = var.search_query_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of currently active queries"
  message = coalesce(var.search_query_change_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.search_query_change_time_aggregator}(${var.search_query_change_timeframe}),${var.search_query_change_timeshift}):
    avg:elastic_cloud.search.query.current${module.filter-tags.query_alert} by {deployment_name}
  >= ${var.search_query_change_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.search_query_change_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.search_query_change_extra_tags)
}

#
# Fetch Change
#
resource "datadog_monitor" "fetch_change" {
  count   = var.fetch_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of search fetches currently running"
  message = coalesce(var.fetch_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.fetch_change_time_aggregator}(${var.fetch_change_timeframe}),${var.fetch_change_timeshift}):
    avg:elastic_cloud.search.fetch.current${module.filter-tags.query_alert} by {deployment_name}
  >= ${var.fetch_change_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.fetch_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.fetch_change_extra_tags)
}

resource "datadog_monitor" "fetch_change_warning" {
  count   = var.fetch_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of search fetches currently running"
  message = coalesce(var.fetch_change_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.fetch_change_time_aggregator}(${var.fetch_change_timeframe}),${var.fetch_change_timeshift}):
    avg:elastic_cloud.search.fetch.current${module.filter-tags.query_alert} by {deployment_name}
  >= ${var.fetch_change_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.fetch_change_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.fetch_change_extra_tags)
}

#
# Field Data Evictions
#
resource "datadog_monitor" "field_data_evictions_change" {
  count   = var.field_data_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the total number of evictions from the fielddata cache"
  message = coalesce(var.field_data_evictions_change_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.field_data_evictions_change_time_aggregator}(${var.field_data_evictions_change_timeframe}),${var.field_data_evictions_change_timeshift}):
    avg:elastic_cloud.fielddata.evictions${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.field_data_evictions_change_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.field_data_evictions_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.field_data_evictions_change_extra_tags)
}

resource "datadog_monitor" "field_data_evictions_change_warning" {
  count   = var.field_data_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the total number of evictions from the fielddata cache"
  message = coalesce(var.field_data_evictions_change_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.field_data_evictions_change_time_aggregator}(${var.field_data_evictions_change_timeframe}),${var.field_data_evictions_change_timeshift}):
    avg:elastic_cloud.fielddata.evictions${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.field_data_evictions_change_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.field_data_evictions_change_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.field_data_evictions_change_extra_tags)
}

#
# Query Cache Evictions
#
resource "datadog_monitor" "query_cache_evictions_change" {
  count   = var.query_cache_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of query cache evictions"
  message = coalesce(var.query_cache_evictions_change_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.query_cache_evictions_change_time_aggregator}(${var.query_cache_evictions_change_timeframe}),${var.query_cache_evictions_change_timeshift}):
    avg:elastic_cloud.indices.query_cache.evictions${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.query_cache_evictions_change_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.query_cache_evictions_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.query_cache_evictions_change_extra_tags)
}

resource "datadog_monitor" "query_cache_evictions_change_warning" {
  count   = var.query_cache_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of query cache evictions"
  message = coalesce(var.query_cache_evictions_change_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.query_cache_evictions_change_time_aggregator}(${var.query_cache_evictions_change_timeframe}),${var.query_cache_evictions_change_timeshift}):
    avg:elastic_cloud.indices.query_cache.evictions${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.query_cache_evictions_change_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.query_cache_evictions_change_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.query_cache_evictions_change_extra_tags)
}

#
# Request Cache Evictions
#
resource "datadog_monitor" "request_cache_evictions_change" {
  count   = var.request_cache_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of request cache evictions"
  message = coalesce(var.request_cache_evictions_change_message, var.message)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.request_cache_evictions_change_time_aggregator}(${var.request_cache_evictions_change_timeframe}),${var.request_cache_evictions_change_timeshift}):
    avg:elastic_cloud.indices.request_cache.evictions${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.request_cache_evictions_change_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.request_cache_evictions_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.request_cache_evictions_change_extra_tags)
}

resource "datadog_monitor" "request_cache_evictions_change_warning" {
  count   = var.request_cache_evictions_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the number of request cache evictions"
  message = coalesce(var.request_cache_evictions_change_message, var.message_warning)
  type    = "query alert"

  // TODO add tags to filter by node type and do not apply this monitor on non-data nodes
  query = <<EOQ
  change(${var.request_cache_evictions_change_time_aggregator}(${var.request_cache_evictions_change_timeframe}),${var.request_cache_evictions_change_timeshift}):
    avg:elastic_cloud.indices.request_cache.evictions${module.filter-tags.query_alert} by {deployment_name,node_name}
  > ${var.request_cache_evictions_change_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.request_cache_evictions_change_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.request_cache_evictions_change_extra_tags)
}

#
# Task Time in Queue
#
resource "datadog_monitor" "task_time_in_queue_change" {
  count   = var.task_time_in_queue_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the average time spent by tasks in the queue"
  message = coalesce(var.task_time_in_queue_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  change(${var.task_time_in_queue_change_time_aggregator}(${var.task_time_in_queue_change_timeframe}),${var.task_time_in_queue_change_timeshift}):
    avg:elastic_cloud.pending_tasks_time_in_queue${module.filter-tags.query_alert} by {deployment_name}
  > ${var.task_time_in_queue_change_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.task_time_in_queue_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true

  tags = concat(local.common_tags, var.tags, var.task_time_in_queue_change_extra_tags)
}

resource "datadog_monitor" "task_time_in_queue_change_warning" {
  count   = var.task_time_in_queue_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{deployment_name.name}}] Elasticsearch change alert on the average time spent by tasks in the queue"
  message = coalesce(var.task_time_in_queue_change_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
  change(${var.task_time_in_queue_change_time_aggregator}(${var.task_time_in_queue_change_timeframe}),${var.task_time_in_queue_change_timeshift}):
    avg:elastic_cloud.pending_tasks_time_in_queue${module.filter-tags.query_alert} by {deployment_name}
  > ${var.task_time_in_queue_change_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.task_time_in_queue_change_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = true


  tags = concat(local.common_tags, var.tags, var.task_time_in_queue_change_extra_tags)
}

