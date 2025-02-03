output "apiserver_id" {
  description = "id for monitor apiserver"
  value       = datadog_monitor.apiserver.*.id
}

output "heartbeat_id" {
  description = "id for monitor heartbeat"
  value       = datadog_monitor.heartbeat.*.id
}

