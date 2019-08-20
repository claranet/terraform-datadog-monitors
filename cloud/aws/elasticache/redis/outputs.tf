output "redis_cache_hits_id" {
  description = "id for monitor redis_cache_hits"
  value       = datadog_monitor.redis_cache_hits.*.id
}

output "redis_commands_id" {
  description = "id for monitor redis_commands"
  value       = datadog_monitor.redis_commands.*.id
}

output "redis_cpu_high_id" {
  description = "id for monitor redis_cpu_high"
  value       = datadog_monitor.redis_cpu_high.*.id
}

output "redis_replication_lag_id" {
  description = "id for monitor redis_replication_lag"
  value       = datadog_monitor.redis_replication_lag.*.id
}

