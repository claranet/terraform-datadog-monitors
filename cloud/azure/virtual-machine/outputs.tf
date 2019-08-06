output "virtualmachine_status_id" {
  description = "id for monitor virtualmachine_status"
  value       = datadog_monitor.virtualmachine_status.*.id
}

output "virtualmachine_cpu_usage_id" {
  description = "id for monitor virtualmachine_cpu_usage"
  value       = datadog_monitor.virtualmachine_cpu_usage.*.id
}

output "virtualmachine_credit_cpu_remaining_too_low_id" {
  description = "id for monitor virtualmachine_credit_cpu_remaining_too_low"
  value       = datadog_monitor.virtualmachine_credit_cpu_remaining_too_low.*.id
}

output "virtualmachine_ram_reserved_id" {
  description = "id for monitor virtualmachine_ram_reserved"
  value       = datadog_monitor.virtualmachine_ram_reserved.*.id
}

output "virtualmachine_disk_space_id" {
  description = "id for monitor virtualmachine_disk_space"
  value       = datadog_monitor.virtualmachine_disk_space.*.id
}

output "virtualmachine_requests_failed_id" {
  description = "id for monitor virtualmachine_requests_failed"
  value       = datadog_monitor.virtualmachine_requests_failed.*.id
}

