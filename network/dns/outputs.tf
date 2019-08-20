output "cannot_resolve_id" {
  description = "id for monitor cannot_resolve"
  value       = datadog_monitor.cannot_resolve.*.id
}

