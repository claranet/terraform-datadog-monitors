output "cpu_utilization_id" {
  value = "${datadog_monitor.cpu_utilization.id}"
}

output "disk_utilization_id" {
  value = "${datadog_monitor.disk_utilization.id}"
}

output "memory_utilization_id" {
  value = "${datadog_monitor.memory_utilization.id}"
}

output "memory_utilization_forecast_id" {
  value = "${datadog_monitor.memory_utilization_forecast.id}"
}

output "failover_unavailable_id" {
  value = "${datadog_monitor.failover_unavailable.id}"
}
