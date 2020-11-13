output "fsx_windows_free_storage_capacity_id" {
  description = "id for monitor fsx_windows_free_storage_capacity"
  value       = datadog_monitor.fsx_windows_free_storage_capacity.*.id
}

output "fsx_windows_throughput_id" {
  description = "id for monitor fsx_windows_throughput"
  value       = datadog_monitor.fsx_windows_throughput.*.id
}