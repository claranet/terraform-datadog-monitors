output "cronjob_id" {
  description = "id for monitor cronjob"
  value       = datadog_monitor.cronjob.*.id
}

output "daemonset_pods_not_ready_id" {
  description = "id for monitor daemonset_pods_not_ready"
  value       = datadog_monitor.daemonset_pods_not_ready.*.id
}

output "deployments_replica_too_low_id" {
  description = "id for monitor deployments_replica_too_low"
  value       = datadog_monitor.deployments_replica_too_low.*.id
}

output "hpa_cannot_scaleup_further_id" {
  description = "id for monitor hpa_cannot_scaleup_further"
  value       = datadog_monitor.hpa_cannot_scaleup_further.*.id
}

output "job_id" {
  description = "id for monitor job"
  value       = datadog_monitor.job.*.id
}

output "pod_disruption_budget_not_respected_id" {
  description = "id for monitor pod_disruption_budget_not_respected"
  value       = datadog_monitor.pod_disruption_budget_not_respected.*.id
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

output "statefulset_pods_not_ready_id" {
  description = "id for monitor statefulset_pods_not_ready"
  value       = datadog_monitor.statefulset_pods_not_ready.*.id
}

