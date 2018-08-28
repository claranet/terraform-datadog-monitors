output "mongodb_primary_id" {
  description = "id for monitor mongodb_primary"
  value       = "${datadog_monitor.mongodb_primary.*.id}"
}

output "mongodb_secondary_id" {
  description = "id for monitor mongodb_secondary"
  value       = "${datadog_monitor.mongodb_secondary.*.id}"
}

output "mongodb_server_count_id" {
  description = "id for monitor mongodb_server_count"
  value       = "${datadog_monitor.mongodb_server_count.*.id}"
}

output "mongodb_replication_id" {
  description = "id for monitor mongodb_replication"
  value       = "${datadog_monitor.mongodb_replication.*.id}"
}
