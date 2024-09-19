resource "datadog_monitor" "backup_vault_backup_unhealthy_event" {
  count   = var.backup_unhealthy_event_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Backup Vault {{name}} has a backup unhealthy event"
  message = coalesce(var.backup_unhealthy_event_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.backup_unhealthy_event_time_aggregator}(${var.backup_unhealthy_event_timeframe}): (
        avg:azure.dataprotection_backup_vaults.backup_health_event${module.filter-tags-unhealthy-event.query_alert} by {name}
      ) > 0
EOQ

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.backup_unhealthy_event_extra_tags)
}

resource "datadog_monitor" "backup_vault_restore_unhealthy_event" {
  count   = var.restore_unhealthy_event_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Backup Vault {{name}} has a backup unhealthy event"
  message = coalesce(var.restore_unhealthy_event_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.restore_unhealthy_event_time_aggregator}(${var.restore_unhealthy_event_timeframe}): (
        avg:azure.dataprotection_backup_vaults.restore_health_event${module.filter-tags-unhealthy-event.query_alert} by {name}
      ) > 0
EOQ

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.restore_unhealthy_event_extra_tags)
}

