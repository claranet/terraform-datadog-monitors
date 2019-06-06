output "memcached_get_hits_id" {
  description = "id for monitor memcached_get_hits"
  value       = datadog_monitor.memcached_get_hits.*.id
}

output "memcached_cpu_high_id" {
  description = "id for monitor memcached_cpu_high"
  value       = datadog_monitor.memcached_cpu_high.*.id
}

