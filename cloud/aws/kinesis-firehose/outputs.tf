output "firehose_incoming_records_id" {
  description = "id for monitor firehose_incoming_records"
  value       = "${datadog_monitor.firehose_incoming_records.id}"
}
