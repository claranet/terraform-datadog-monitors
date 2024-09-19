output "recovery_services_vault_backup_unhealthy_event_id" {
  description = "id for monitor recovery_services_vault_backup_unhealthy_event"
  value       = datadog_monitor.recovery_services_vault_backup_unhealthy_event.*.id
}

output "recovery_services_vault_restore_unhealthy_event_id" {
  description = "id for monitor recovery_services_vault_restore_unhealthy_event"
  value       = datadog_monitor.recovery_services_vault_restore_unhealthy_event.*.id
}

