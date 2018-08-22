output "datadog_cpu_too_high_id" {
  description = "id for monitor datadog_cpu_too_high"
  value       = "${datadog_monitor.datadog_cpu_too_high.id}"
}

output "datadog_load_too_high_id" {
  description = "id for monitor datadog_load_too_high"
  value       = "${datadog_monitor.datadog_load_too_high.id}"
}

output "datadog_free_disk_space_too_low_id" {
  description = "id for monitor datadog_free_disk_space_too_low"
  value       = "${datadog_monitor.datadog_free_disk_space_too_low.id}"
}

output "datadog_free_disk_space_forecast_id" {
  description = "id for monitor datadog_free_disk_space_forecast"
  value       = "${datadog_monitor.datadog_free_disk_space_forecast.id}"
}

output "datadog_free_disk_space_inodes_too_low_id" {
  description = "id for monitor datadog_free_disk_space_inodes_too_low"
  value       = "${datadog_monitor.datadog_free_disk_space_inodes_too_low.id}"
}

output "datadog_free_memory_id" {
  description = "id for monitor datadog_free_memory"
  value       = "${datadog_monitor.datadog_free_memory.id}"
}
