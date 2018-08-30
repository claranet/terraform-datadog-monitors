output "replication_lag_id" {
  description = "id for monitor replication_lag"
  value       = "${datadog_monitor.replication_lag.*.id}"
}
