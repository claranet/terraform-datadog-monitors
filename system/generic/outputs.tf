output "cpu_id" {
  description = "id for monitor cpu"
  value       = "${datadog_monitor.cpu.*.id}"
}

output "load_id" {
  description = "id for monitor load"
  value       = "${datadog_monitor.load.*.id}"
}

output "disk_space_id" {
  description = "id for monitor disk_space"
  value       = "${datadog_monitor.disk_space.*.id}"
}

output "disk_space_forecast_id" {
  description = "id for monitor disk_space_forecast"
  value       = "${datadog_monitor.disk_space_forecast.*.id}"
}

output "disk_inodes_id" {
  description = "id for monitor disk_inodes"
  value       = "${datadog_monitor.disk_inodes.*.id}"
}

output "memory_id" {
  description = "id for monitor memory"
  value       = "${datadog_monitor.memory.*.id}"
}
