output "sql_elasticpool_cpu_id" {
  description = "id for monitor sql_elasticpool_cpu"
  value       = datadog_monitor.sql_elasticpool_cpu.*.id
}

output "sql_elasticpool_free_space_low_id" {
  description = "id for monitor sql_elasticpool_free_space_low"
  value       = datadog_monitor.sql_elasticpool_free_space_low.*.id
}

output "sql_elasticpool_dtu_consumption_high_id" {
  description = "id for monitor sql_elasticpool_dtu_consumption_high"
  value       = datadog_monitor.sql_elasticpool_dtu_consumption_high.*.id
}

