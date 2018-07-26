output "custom_webcheck_error_id" {
  description = "id for monitor custom_webcheck_error"
  value       = "${datadog_monitor.custom_webcheck_error.id}"
}

output "custom_webcheck_latency_id" {
  description = "id for monitor custom_webcheck_latency"
  value       = "${datadog_monitor.custom_webcheck_latency.id}"
}
