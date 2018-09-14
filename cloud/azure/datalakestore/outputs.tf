output "datalakestore_status_id" {
  description = "id for monitor datalakestore_status"
  value       = "${datadog_monitor.datalakestore_status.*.id}"
}
