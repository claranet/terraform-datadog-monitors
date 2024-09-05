output "backup_vault_backup_unhealthy_event_id" {
  description = "id for monitor backup_vault_backup_unhealthy_event"
  value       = datadog_monitor.backup_vault_backup_unhealthy_event.*.id
}

output "backup_vault_restore_unhealthy_event_id" {
  description = "id for monitor backup_vault_restore_unhealthy_event"
  value       = datadog_monitor.backup_vault_restore_unhealthy_event.*.id
}

