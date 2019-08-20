output "apimgt_failed_requests_id" {
  description = "id for monitor apimgt_failed_requests"
  value       = datadog_monitor.apimgt_failed_requests.*.id
}

output "apimgt_other_requests_id" {
  description = "id for monitor apimgt_other_requests"
  value       = datadog_monitor.apimgt_other_requests.*.id
}

output "apimgt_status_id" {
  description = "id for monitor apimgt_status"
  value       = datadog_monitor.apimgt_status.*.id
}

output "apimgt_successful_requests_id" {
  description = "id for monitor apimgt_successful_requests"
  value       = datadog_monitor.apimgt_successful_requests.*.id
}

output "apimgt_unauthorized_requests_id" {
  description = "id for monitor apimgt_unauthorized_requests"
  value       = datadog_monitor.apimgt_unauthorized_requests.*.id
}

