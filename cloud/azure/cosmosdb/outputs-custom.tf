output "cosmos_db_ru_utilization_id" {
  description = "id for monitor cosmos_db_ru_utilization"
  value       = "${datadog_monitor.cosmos_db_ru_utilization.*.id}"
}
