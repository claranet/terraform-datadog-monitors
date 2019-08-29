output "datadog_cassandra_process_down_id" {
  description = "id for monitor datadog_cassandra_process_down"
  value       = datadog_monitor.datadog_cassandra_process_down.*.id
}

output "datadog_monitor_cassandra_exceptions_id" {
  description = "id for monitor datadog_monitor_cassandra_exceptions"
  value       = datadog_monitor.datadog_monitor_cassandra_exceptions.*.id
}

output "datadog_monitor_cassandra_key_cache_id" {
  description = "id for monitor datadog_monitor_cassandra_key_cache"
  value       = datadog_monitor.datadog_monitor_cassandra_key_cache.*.id
}

output "datadog_monitor_cassandra_read_latency_id" {
  description = "id for monitor datadog_monitor_cassandra_read_latency"
  value       = datadog_monitor.datadog_monitor_cassandra_read_latency.*.id
}

output "datadog_monitor_cassandra_write_latency_id" {
  description = "id for monitor datadog_monitor_cassandra_write_latency"
  value       = datadog_monitor.datadog_monitor_cassandra_write_latency.*.id
}

output "datadog_node_cassandra_down_id" {
  description = "id for monitor datadog_node_cassandra_down"
  value       = datadog_monitor.datadog_node_cassandra_down.*.id
}

