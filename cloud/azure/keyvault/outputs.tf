output "keyvault_status_id" {
  description = "id for monitor keyvault_status"
  value       = datadog_monitor.keyvault_status.*.id
}

output "keyvault_api_result_id" {
  description = "id for monitor keyvault_api_result"
  value       = datadog_monitor.keyvault_api_result.*.id
}

output "keyvault_api_latency_id" {
  description = "id for monitor keyvault_api_latency"
  value       = datadog_monitor.keyvault_api_latency.*.id
}

