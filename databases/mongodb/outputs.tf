output "mongodb_replicaset_state_id" {
  description = "id for monitor mongodb_replicaset_state"
  value       = "${datadog_monitor.mongodb_replicaset_state.id}"
}
