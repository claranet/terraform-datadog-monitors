output "apiserver_id" {
  description = "id for monitor apiserver"
  value       = datadog_monitor.apiserver.*.id
}

