output "errors_id" {
  description = "id for monitor errors"
  value       = datadog_monitor.errors.*.id
}

output "invocations_id" {
  description = "id for monitor invocations"
  value       = datadog_monitor.invocations.*.id
}

output "pct_errors_id" {
  description = "id for monitor pct_errors"
  value       = datadog_monitor.pct_errors.*.id
}

output "throttles_id" {
  description = "id for monitor throttles"
  value       = datadog_monitor.throttles.*.id
}

