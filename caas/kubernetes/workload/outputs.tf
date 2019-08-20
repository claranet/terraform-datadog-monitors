output "cronjob_id" {
  description = "id for monitor cronjob"
  value       = datadog_monitor.cronjob.*.id
}

output "job_id" {
  description = "id for monitor job"
  value       = datadog_monitor.job.*.id
}

output "replica_available_id" {
  description = "id for monitor replica_available"
  value       = datadog_monitor.replica_available.*.id
}

output "replica_current_id" {
  description = "id for monitor replica_current"
  value       = datadog_monitor.replica_current.*.id
}

output "replica_ready_id" {
  description = "id for monitor replica_ready"
  value       = datadog_monitor.replica_ready.*.id
}

