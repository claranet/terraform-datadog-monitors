output "cosmos_db_status_id" {
  description = "id for monitor cosmos_db_status"
  value       = "${datadog_monitor.cosmos_db_status.id}"
}

output "cosmos_db_4xx_requests_id" {
  description = "id for monitor cosmos_db_4xx_requests"
  value       = "${datadog_monitor.cosmos_db_4xx_requests.id}"
}

output "cosmos_db_5xx_requests_id" {
  description = "id for monitor cosmos_db_5xx_requests"
  value       = "${datadog_monitor.cosmos_db_5xx_requests.id}"
}

output "cosmos_db_success_no_data_id" {
  description = "id for monitor cosmos_db_success_no_data"
  value       = "${datadog_monitor.cosmos_db_success_no_data.id}"
}

output "cosmos_db_ru_utilization_id" {
  description = "id for monitor cosmos_db_ru_utilization"
  value       = "${datadog_monitor.cosmos_db_ru_utilization.*.id}"
}
