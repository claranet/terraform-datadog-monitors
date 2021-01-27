output "system_memory_usage_ratio_id" {
  description = "id for monitor system_memory_usage_ratio"
  value       = datadog_monitor.system_memory_usage_ratio.*.id
}

