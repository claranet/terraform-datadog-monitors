output "host_agile_anomaly_id" {
  description = "id for monitor host_agile_anomaly"
  value       = datadog_monitor.host_agile_anomaly.*.id
}

output "host_basic_anomaly_id" {
  description = "id for monitor host_basic_anomaly"
  value       = datadog_monitor.host_basic_anomaly.*.id
}

output "host_change_id" {
  description = "id for monitor host_change"
  value       = datadog_monitor.host_change.*.id
}

output "host_timeshift_id" {
  description = "id for monitor host_timeshift"
  value       = datadog_monitor.host_timeshift.*.id
}

