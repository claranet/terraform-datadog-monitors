output "rds_burst_balance_id" {
  description = "id for monitor rds_burst_balance"
  value       = datadog_monitor.rds_burst_balance.*.id
}

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

output "rds_freeable_memory_id" {
  description = "id for monitor rds_freeable_memory"
  value       = datadog_monitor.rds_freeable_memory.*.id
}

output "rds_read_iops_id" {
  description = "id for monitor rds_read_iops"
  value       = datadog_monitor.rds_read_iops.*.id
}

output "rds_replica_lag_id" {
  description = "id for monitor rds_replica_lag"
  value       = datadog_monitor.rds_replica_lag.*.id
}

output "rds_write_iops_id" {
  description = "id for monitor rds_write_iops"
  value       = datadog_monitor.rds_write_iops.*.id
}

