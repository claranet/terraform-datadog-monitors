output "datadog_monitor_cassandra_outliers_latency_id" {
  description = "id for monitor datadog_monitor_cassandra_outliers_latency"
  value       = datadog_monitor.datadog_monitor_cassandra_outliers_latency.*.id
}

