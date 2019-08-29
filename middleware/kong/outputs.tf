output "not_responding_id" {
  description = "id for monitor not_responding"
  value       = datadog_monitor.not_responding.*.id
}

output "treatment_limit_id" {
  description = "id for monitor treatment_limit"
  value       = datadog_monitor.treatment_limit.*.id
}

