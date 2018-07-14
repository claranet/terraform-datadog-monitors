output "rds_cpu_90_15min_id" {
  description = "id for monitor rds_cpu_90_15min"
  value       = "${datadog_monitor.rds_cpu_90_15min.id}"
}

output "rds_free_space_low_id" {
  description = "id for monitor rds_free_space_low"
  value       = "${datadog_monitor.rds_free_space_low.id}"
}
