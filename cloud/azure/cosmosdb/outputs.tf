output "cosmos_db_4xx_requests_id" {
  description = "id for monitor cosmos_db_4xx_requests"
  value       = datadog_monitor.cosmos_db_4xx_requests.*.id
}

output "cosmos_db_5xx_requests_id" {
  description = "id for monitor cosmos_db_5xx_requests"
  value       = datadog_monitor.cosmos_db_5xx_requests.*.id
}

output "cosmos_db_scaling_id" {
  description = "id for monitor cosmos_db_scaling"
  value       = datadog_monitor.cosmos_db_scaling.*.id
}

output "cosmos_db_status_id" {
  description = "id for monitor cosmos_db_status"
  value       = datadog_monitor.cosmos_db_status.*.id
}

