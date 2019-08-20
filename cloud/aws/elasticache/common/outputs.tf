output "elasticache_eviction_id" {
  description = "id for monitor elasticache_eviction"
  value       = datadog_monitor.elasticache_eviction.*.id
}

output "elasticache_eviction_growing_id" {
  description = "id for monitor elasticache_eviction_growing"
  value       = datadog_monitor.elasticache_eviction_growing.*.id
}

output "elasticache_free_memory_id" {
  description = "id for monitor elasticache_free_memory"
  value       = datadog_monitor.elasticache_free_memory.*.id
}

output "elasticache_max_connection_id" {
  description = "id for monitor elasticache_max_connection"
  value       = datadog_monitor.elasticache_max_connection.*.id
}

output "elasticache_no_connection_id" {
  description = "id for monitor elasticache_no_connection"
  value       = datadog_monitor.elasticache_no_connection.*.id
}

output "elasticache_swap_id" {
  description = "id for monitor elasticache_swap"
  value       = datadog_monitor.elasticache_swap.*.id
}

