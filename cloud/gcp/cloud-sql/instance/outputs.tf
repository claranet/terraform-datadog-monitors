output "cpu_utilization_id" {
  description = "id for monitor cpu_utilization"
  value       = "${datadog_monitor.cpu_utilization.id}"
}

output "disk_utilization_id" {
  description = "id for monitor disk_utilization"
  value       = "${datadog_monitor.disk_utilization.id}"
}

output "memory_utilization_id" {
  description = "id for monitor memory_utilization"
  value       = "${datadog_monitor.memory_utilization.id}"
}

output "memory_utilization_forecast_id" {
  description = "id for monitor memory_utilization_forecast"
  value       = "${datadog_monitor.memory_utilization_forecast.id}"
}

output "failover_unavailable_id" {
  description = "id for monitor failover_unavailable"
  value       = "${datadog_monitor.failover_unavailable.id}"
}
