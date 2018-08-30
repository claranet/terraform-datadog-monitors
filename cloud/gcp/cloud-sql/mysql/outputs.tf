output "replication_lag_id" {
  description = "id for monitor replication_lag"
  value       = "${datadog_monitor.replication_lag.*.id}"
}

output "queries_changing_anomaly_id" {
  description = "id for monitor queries_changing_anomaly"
  value       = "${datadog_monitor.queries_changing_anomaly.*.id}"
}

output "questions_changing_anomaly_id" {
  description = "id for monitor questions_changing_anomaly"
  value       = "${datadog_monitor.questions_changing_anomaly.*.id}"
}
