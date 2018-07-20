output "redis_evictedkeys_id" {
  description = "id for monitor redis_evictedkeys"
  value       = "${datadog_monitor.redis_evictedkeys.id}"
}

output "redis_expirations_id" {
  description = "id for monitor redis_expirations"
  value       = "${datadog_monitor.redis_expirations.id}"
}

output "redis_blocked_clients_id" {
  description = "id for monitor redis_blocked_clients"
  value       = "${datadog_monitor.redis_blocked_clients.id}"
}

output "redis_keyspace_id" {
  description = "id for monitor redis_keyspace"
  value       = "${datadog_monitor.redis_keyspace.id}"
}

output "redis_mem_used_id" {
  description = "id for monitor redis_mem_used"
  value       = "${datadog_monitor.redis_mem_used.id}"
}

output "redis_mem_frag_id" {
  description = "id for monitor redis_mem_frag"
  value       = "${datadog_monitor.redis_mem_frag.id}"
}

output "redis_rejected_con_id" {
  description = "id for monitor redis_rejected_con"
  value       = "${datadog_monitor.redis_rejected_con.id}"
}

output "redis_latency_id" {
  description = "id for monitor redis_latency"
  value       = "${datadog_monitor.redis_latency.id}"
}

output "redis_hitrate_id" {
  description = "id for monitor redis_hitrate"
  value       = "${datadog_monitor.redis_hitrate.id}"
}
