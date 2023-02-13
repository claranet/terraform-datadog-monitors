output "rds_connection_variance_id" {
  description = "id for monitor rds_connection_variance"
  value       = datadog_monitor.rds_connection_variance.*.id
}

output "rds_cpu_90_15min_id" {
  description = "id for monitor rds_cpu_90_15min"
  value       = datadog_monitor.rds_cpu_90_15min.*.id
}

output "rds_free_space_low_id" {
  description = "id for monitor rds_free_space_low"
  value       = datadog_monitor.rds_free_space_low.*.id
}

output "rds_replica_lag_id" {
  description = "id for monitor rds_replica_lag"
  value       = datadog_monitor.rds_replica_lag.*.id
}

