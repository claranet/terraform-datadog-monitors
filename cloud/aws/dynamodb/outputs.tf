output "provisioned_read_capacity_id" {
  description = "id for monitor provisioned read capacity"
  value       = datadog_monitor.provisioned_read_capacity_utilization.*.id
}

output "provisioned_write_capacity_id" {
  description = "id for monitor provisioned write capacity"
  value       = datadog_monitor.provisioned_write_capacity_utilization.*.id
}