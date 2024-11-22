output "redis_commands_id" {
  description = "id for monitor redis_commands"
  value       = datadog_monitor.redis_commands.*.id
}

output "redis_cpu_high_id" {
  description = "id for monitor redis_cpu_high"
  value       = datadog_monitor.redis_cpu_high.*.id
}
