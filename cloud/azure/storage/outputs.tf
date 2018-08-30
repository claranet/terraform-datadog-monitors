output "availability_id" {
  description = "id for monitor availability"
  value       = "${datadog_monitor.availability.*.id}"
}

output "successful_requests_id" {
  description = "id for monitor successful_requests"
  value       = "${datadog_monitor.successful_requests.*.id}"
}

output "latency_id" {
  description = "id for monitor latency"
  value       = "${datadog_monitor.latency.*.id}"
}

output "timeout_error_requests_id" {
  description = "id for monitor timeout_error_requests"
  value       = "${datadog_monitor.timeout_error_requests.*.id}"
}

output "network_error_requests_id" {
  description = "id for monitor network_error_requests"
  value       = "${datadog_monitor.network_error_requests.*.id}"
}

output "throttling_error_requests_id" {
  description = "id for monitor throttling_error_requests"
  value       = "${datadog_monitor.throttling_error_requests.*.id}"
}

output "server_other_error_requests_id" {
  description = "id for monitor server_other_error_requests"
  value       = "${datadog_monitor.server_other_error_requests.*.id}"
}

output "client_other_error_requests_id" {
  description = "id for monitor client_other_error_requests"
  value       = "${datadog_monitor.client_other_error_requests.*.id}"
}

output "authorization_error_requests_id" {
  description = "id for monitor authorization_error_requests"
  value       = "${datadog_monitor.authorization_error_requests.*.id}"
}
