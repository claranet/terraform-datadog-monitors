output "disk_free_space_id" {
  description = "id for monitor disk_free_space"
  value       = datadog_monitor.disk_free_space.*.id
}

output "unacknowledged_messages_high_id" {
  description = "id for monitor unacknowledged_messages_high"
  value       = datadog_monitor.unacknowledged_messages_high.*.id
}

output "memory_usage_high_id" {
  description = "id for monitor memory_usage_high"
  value       = datadog_monitor.memory_usage_high.*.id
}

output "messages_ready_id" {
  description = "id for monitor messages_ready"
  value       = datadog_monitor.messages_ready.*.id
}

output "no_consumers_id" {
  description = "id for monitor no_consumers"
  value       = datadog_monitor.no_consumers.*.id
}

output "unack_rate_id" {
  description = "id for monitor unack_rate"
  value       = datadog_monitor.unack_rate.*.id
}
