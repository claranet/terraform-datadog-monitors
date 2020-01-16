output "mysql_aborted_id" {
  description = "id for monitor mysql_aborted"
  value       = datadog_monitor.mysql_aborted.*.id
}

output "mysql_availability_id" {
  description = "id for monitor mysql_availability"
  value       = datadog_monitor.mysql_availability.*.id
}

output "mysql_connection_id" {
  description = "id for monitor mysql_connection"
  value       = datadog_monitor.mysql_connection.*.id
}

output "mysql_pool_efficiency_high_id" {
  description = "id for monitor mysql_pool_efficiency_high"
  value       = datadog_monitor.mysql_pool_efficiency_high.*.id
}

output "mysql_pool_efficiency_low_id" {
  description = "id for monitor mysql_pool_efficiency_low"
  value       = datadog_monitor.mysql_pool_efficiency_low.*.id
}

output "mysql_pool_utilization_high_id" {
  description = "id for monitor mysql_pool_utilization_high"
  value       = datadog_monitor.mysql_pool_utilization_high.*.id
}

output "mysql_pool_utilization_low_id" {
  description = "id for monitor mysql_pool_utilization_low"
  value       = datadog_monitor.mysql_pool_utilization_low.*.id
}

output "mysql_questions_anomaly_id" {
  description = "id for monitor mysql_questions_anomaly"
  value       = datadog_monitor.mysql_questions_anomaly.*.id
}

output "mysql_replication_lag_id" {
  description = "id for monitor mysql_replication_lag"
  value       = datadog_monitor.mysql_replication_lag.*.id
}

output "mysql_replication_status_id" {
  description = "id for monitor mysql_replication_status"
  value       = datadog_monitor.mysql_replication_status.*.id
}

output "mysql_slow_id" {
  description = "id for monitor mysql_slow"
  value       = datadog_monitor.mysql_slow.*.id
}

output "mysql_threads_anomaly_id" {
  description = "id for monitor mysql_threads_anomaly"
  value       = datadog_monitor.mysql_threads_anomaly.*.id
}

