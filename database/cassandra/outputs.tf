output "datadog_cassandra_process_down_id" {
  description = "id for monitor datadog_cassandra_process_down"
  value       = datadog_monitor.datadog_cassandra_process_down.*.id
}

output "datadog_node_cassandra_down_id" {
  description = "id for monitor datadog_node_cassandra_down"
  value       = datadog_monitor.datadog_node_cassandra_down.*.id
}

