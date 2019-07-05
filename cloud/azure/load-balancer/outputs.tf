output "loadbalancer_status_id" {
  description = "id for monitor loadbalancer_status"
  value       = datadog_monitor.loadbalancer_status.*.id
}

