output "available_slots_id" {
  description = "id for monitor available_slots"
  value       = datadog_monitor.available_slots.*.id
}

output "concurrent_queries_id" {
  description = "id for monitor concurrent_queries"
  value       = datadog_monitor.concurrent_queries.*.id
}

output "execution_time_id" {
  description = "id for monitor execution_time"
  value       = datadog_monitor.execution_time.*.id
}

output "scanned_bytes_id" {
  description = "id for monitor scanned_bytes"
  value       = datadog_monitor.scanned_bytes.*.id
}

output "scanned_bytes_billed_id" {
  description = "id for monitor scanned_bytes_billed"
  value       = datadog_monitor.scanned_bytes_billed.*.id
}

output "stored_bytes_id" {
  description = "id for monitor stored_bytes"
  value       = datadog_monitor.stored_bytes.*.id
}

output "table_count_id" {
  description = "id for monitor table_count"
  value       = datadog_monitor.table_count.*.id
}

output "uploaded_bytes_id" {
  description = "id for monitor uploaded_bytes"
  value       = datadog_monitor.uploaded_bytes.*.id
}

output "uploaded_bytes_billed_id" {
  description = "id for monitor uploaded_bytes_billed"
  value       = datadog_monitor.uploaded_bytes_billed.*.id
}

