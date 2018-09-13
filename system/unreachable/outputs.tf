output "host_unreachable_id" {
  description = "id for monitor host_unreachable"
  value       = "${datadog_monitor.host_unreachable.*.id}"
}
