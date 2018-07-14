output "status_id" {
  description = "id for monitor status"
  value       = "${datadog_monitor.status.id}"
}

output "evictedkeys_id" {
  description = "id for monitor evictedkeys"
  value       = "${datadog_monitor.evictedkeys.id}"
}

output "percent_processor_time_id" {
  description = "id for monitor percent_processor_time"
  value       = "${datadog_monitor.percent_processor_time.id}"
}

output "server_load_id" {
  description = "id for monitor server_load"
  value       = "${datadog_monitor.server_load.id}"
}
