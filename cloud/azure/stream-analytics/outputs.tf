output "conversion_errors_id" {
  description = "id for monitor conversion_errors"
  value       = datadog_monitor.conversion_errors.*.id
}

output "failed_function_requests_id" {
  description = "id for monitor failed_function_requests"
  value       = datadog_monitor.failed_function_requests.*.id
}

output "runtime_errors_id" {
  description = "id for monitor runtime_errors"
  value       = datadog_monitor.runtime_errors.*.id
}

output "status_id" {
  description = "id for monitor status"
  value       = datadog_monitor.status.*.id
}

output "su_utilization_id" {
  description = "id for monitor su_utilization"
  value       = datadog_monitor.su_utilization.*.id
}

