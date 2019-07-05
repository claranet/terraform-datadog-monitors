output "VPN_status_id" {
  description = "id for monitor VPN_status"
  value       = datadog_monitor.VPN_status.*.id
}

