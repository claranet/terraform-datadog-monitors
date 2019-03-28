output "cpu_utilization_id" {
  description = "id for monitor cpu_utilization"
  value       = "${datadog_monitor.cpu_utilization.*.id}"
}

output "disk_throttled_bps_id" {
  description = "id for monitor disk_throttled_bps"
  value       = "${datadog_monitor.disk_throttled_bps.*.id}"
}

output "disk_throttled_ops_id" {
  description = "id for monitor disk_throttled_ops"
  value       = "${datadog_monitor.disk_throttled_ops.*.id}"
}
