output "vpngw_connexion_status_id" {
  description = "id for monitor vpngw_connexion_status"
  value       = datadog_monitor.vpngw_connexion_status.*.id
}

