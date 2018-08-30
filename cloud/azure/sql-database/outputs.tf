output "sql-database_cpu_90_15min_id" {
  description = "id for monitor sql-database_cpu_90_15min"
  value       = "${datadog_monitor.sql-database_cpu_90_15min.*.id}"
}

output "sql-database_free_space_low_id" {
  description = "id for monitor sql-database_free_space_low"
  value       = "${datadog_monitor.sql-database_free_space_low.*.id}"
}

output "sql-database_dtu_consumption_high_id" {
  description = "id for monitor sql-database_dtu_consumption_high"
  value       = "${datadog_monitor.sql-database_dtu_consumption_high.*.id}"
}

output "sql-database_deadlocks_count_id" {
  description = "id for monitor sql-database_deadlocks_count"
  value       = "${datadog_monitor.sql-database_deadlocks_count.*.id}"
}
