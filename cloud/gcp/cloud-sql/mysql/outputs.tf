output "network_connections_id" {
  value = "${datadog_monitor.network_connections.id}"
}

output "replication_lag_id" {
  value = "${datadog_monitor.replication_lag.id}"
}

output "queries_changing_anomaly_id" {
  value = ["${datadog_monitor.queries_changing_anomaly.*.id}"]
}

output "questions_changing_anomaly_id" {
  value = ["${datadog_monitor.questions_changing_anomaly.*.id}"]
}
