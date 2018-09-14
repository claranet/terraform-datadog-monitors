output "not_responding_id" {
  description = "id for monitor not_responding"
  value       = "${datadog_monitor.not_responding.*.id}"
}

output "cluster_status_not_green_id" {
  description = "id for monitor cluster_status_not_green"
  value       = "${datadog_monitor.cluster_status_not_green.*.id}"
}

output "cluster_initializing_shards_id" {
  description = "id for monitor cluster_initializing_shards"
  value       = "${datadog_monitor.cluster_initializing_shards.*.id}"
}

output "cluster_relocating_shards_id" {
  description = "id for monitor cluster_relocating_shards"
  value       = "${datadog_monitor.cluster_relocating_shards.*.id}"
}

output "cluster_unassigned_shards_id" {
  description = "id for monitor cluster_unassigned_shards"
  value       = "${datadog_monitor.cluster_unassigned_shards.*.id}"
}

output "node_free_space_id" {
  description = "id for monitor node_free_space"
  value       = "${datadog_monitor.node_free_space.*.id}"
}

output "jvm_heap_memory_usage_id" {
  description = "id for monitor jvm_heap_memory_usage"
  value       = "${datadog_monitor.jvm_heap_memory_usage.*.id}"
}

output "jvm_memory_young_usage_id" {
  description = "id for monitor jvm_memory_young_usage"
  value       = "${datadog_monitor.jvm_memory_young_usage.*.id}"
}

output "jvm_memory_old_usage_id" {
  description = "id for monitor jvm_memory_old_usage"
  value       = "${datadog_monitor.jvm_memory_old_usage.*.id}"
}

output "jvm_gc_old_collection_latency_id" {
  description = "id for monitor jvm_gc_old_collection_latency"
  value       = "${datadog_monitor.jvm_gc_old_collection_latency.*.id}"
}

output "jvm_gc_young_collection_latency_id" {
  description = "id for monitor jvm_gc_young_collection_latency"
  value       = "${datadog_monitor.jvm_gc_young_collection_latency.*.id}"
}

output "indexing_latency_id" {
  description = "id for monitor indexing_latency"
  value       = "${datadog_monitor.indexing_latency.*.id}"
}

output "flush_latency_id" {
  description = "id for monitor flush_latency"
  value       = "${datadog_monitor.flush_latency.*.id}"
}

output "http_connections_anomaly_id" {
  description = "id for monitor http_connections_anomaly"
  value       = "${datadog_monitor.http_connections_anomaly.*.id}"
}

output "search_query_latency_id" {
  description = "id for monitor search_query_latency"
  value       = "${datadog_monitor.search_query_latency.*.id}"
}

output "fetch_latency_id" {
  description = "id for monitor fetch_latency"
  value       = "${datadog_monitor.fetch_latency.*.id}"
}

output "search_query_change_id" {
  description = "id for monitor search_query_change"
  value       = "${datadog_monitor.search_query_change.*.id}"
}

output "fetch_change_id" {
  description = "id for monitor fetch_change"
  value       = "${datadog_monitor.fetch_change.*.id}"
}

output "field_data_evictions_change_id" {
  description = "id for monitor field_data_evictions_change"
  value       = "${datadog_monitor.field_data_evictions_change.*.id}"
}

output "query_cache_evictions_change_id" {
  description = "id for monitor query_cache_evictions_change"
  value       = "${datadog_monitor.query_cache_evictions_change.*.id}"
}

output "request_cache_evictions_change_id" {
  description = "id for monitor request_cache_evictions_change"
  value       = "${datadog_monitor.request_cache_evictions_change.*.id}"
}

output "task_time_in_queue_change_id" {
  description = "id for monitor task_time_in_queue_change"
  value       = "${datadog_monitor.task_time_in_queue_change.*.id}"
}
