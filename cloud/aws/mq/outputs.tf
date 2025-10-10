output "consumer_count_id" {
  description = "id for monitor consumer_count"
  value       = datadog_monitor.consumer_count.*.id
}

output "cpu_utilization_id" {
  description = "id for monitor cpu_utilization"
  value       = datadog_monitor.cpu_utilization.*.id
}

output "disk_free_limit_id" {
  description = "id for monitor disk_free_limit"
  value       = datadog_monitor.disk_free_limit.*.id
}

output "memory_utilization_id" {
  description = "id for monitor memory_utilization"
  value       = datadog_monitor.memory_utilization.*.id
}

output "messages_ready_id" {
  description = "id for monitor messages_ready"
  value       = datadog_monitor.messages_ready.*.id
}

