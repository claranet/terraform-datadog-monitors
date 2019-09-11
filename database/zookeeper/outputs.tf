output "datadog_monitor_zookeeper_latency_id" {
  description = "id for monitor datadog_monitor_zookeeper_latency"
  value       = datadog_monitor.datadog_monitor_zookeeper_latency.*.id
}

output "datadog_zookeeper_process_down_id" {
  description = "id for monitor datadog_zookeeper_process_down"
  value       = datadog_monitor.datadog_zookeeper_process_down.*.id
}

