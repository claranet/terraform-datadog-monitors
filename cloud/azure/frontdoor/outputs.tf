output "frontdoor_backend_health_id" {
  description = "id for monitor frontdoor_backend_health"
  value       = datadog_monitor.frontdoor_backend_health.*.id
}

output "frontdoor_backend_request_latency_id" {
  description = "id for monitor frontdoor_backend_request_latency"
  value       = datadog_monitor.frontdoor_backend_request_latency.*.id
}

output "frontdoor_request_count_id" {
  description = "id for monitor frontdoor_request_count"
  value       = datadog_monitor.frontdoor_request_count.*.id
}

output "frontdoor_status_id" {
  description = "id for monitor frontdoor_status"
  value       = datadog_monitor.frontdoor_status.*.id
}

output "frontdoor_total_latency_id" {
  description = "id for monitor frontdoor_total_latency"
  value       = datadog_monitor.frontdoor_total_latency.*.id
}

