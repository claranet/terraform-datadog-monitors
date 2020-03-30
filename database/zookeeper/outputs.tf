output "datadog_monitor_zookeeper_latency_id" {
  description = "id for monitor datadog_monitor_zookeeper_latency"
  value       = datadog_monitor.datadog_monitor_zookeeper_latency.*.id
}

output "not_responding_id" {
  description = "id for monitor not_responding"
  value       = datadog_monitor.not_responding.*.id
}

