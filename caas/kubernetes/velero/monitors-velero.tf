resource "datadog_monitor" "velero_scheduled_backup_missing" {
  count   = var.velero_scheduled_backup_missing_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Velero scheduled backup missing"
  type    = "query alert"
  message = coalesce(var.velero_scheduled_backup_missing_monitor_message, var.message)

  query = <<EOQ
    sum(${var.velero_scheduled_backup_missing_monitor_timeframe}):sum:velero.velero_backup_success_total${module.filter-tags-scheduled-backup.query_alert} by {cluster-name,schedule}.as_count() < 1
EOQ

  thresholds = {
    critical = 1
  }

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.velero_scheduled_backup_missing_monitor_no_data_timeframe

  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:caas", "provider:openmetrics", "resource:velero", "team:claranet", "created-by:terraform"], var.velero_scheduled_backup_missing_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "velero_backup_failure" {
  count   = var.velero_backup_failure_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Velero backup failure"
  type    = "query alert"
  message = coalesce(var.velero_backup_failure_monitor_message, var.message)

  query = <<EOQ
    sum(${var.velero_backup_failure_monitor_timeframe}):min:velero.velero_backup_failure_total${module.filter-tags.query_alert} by {schedule}.as_count() > 1
EOQ

  thresholds = {
    critical = 1
    warning  = 0
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:caas", "provider:openmetrics", "resource:velero", "team:claranet", "created-by:terraform"], var.velero_backup_failure_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "velero_backup_partial_failure" {
  count   = var.velero_backup_partial_failure_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Velero backup partial failure"
  type    = "query alert"
  message = coalesce(var.velero_backup_partial_failure_monitor_message, var.message)

  query = <<EOQ
    sum(${var.velero_backup_partial_failure_monitor_timeframe}):min:velero.velero_backup_partial_failure_total${module.filter-tags.query_alert} by {schedule}.as_count() > 1
EOQ

  thresholds = {
    critical = 1
    warning  = 0
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:caas", "provider:openmetrics", "resource:velero", "team:claranet", "created-by:terraform"], var.velero_backup_partial_failure_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "velero_backup_deletion_failure" {
  count   = var.velero_backup_deletion_failure_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Velero backup deletion failure"
  type    = "query alert"
  message = coalesce(var.velero_backup_deletion_failure_monitor_message, var.message)

  query = <<EOQ
    sum(${var.velero_backup_deletion_failure_monitor_timeframe}):min:velero.velero_backup_deletion_failure_total${module.filter-tags.query_alert} by {schedule}.as_count() > 1
EOQ

  thresholds = {
    critical = 1
    warning  = 0
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:caas", "provider:openmetrics", "resource:velero", "team:claranet", "created-by:terraform"], var.velero_backup_deletion_failure_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "velero_volume_snapshot_failure" {
  count   = var.velero_volume_snapshot_failure_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Velero volume snapshot failure"
  type    = "query alert"
  message = coalesce(var.velero_volume_snapshot_failure_monitor_message, var.message)

  query = <<EOQ
    sum(${var.velero_volume_snapshot_failure_monitor_timeframe}):min:velero.velero_volume_snapshot_failure_total${module.filter-tags.query_alert} by {schedule}.as_count() > 1
EOQ

  thresholds = {
    critical = 1
    warning  = 0
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:caas", "provider:openmetrics", "resource:velero", "team:claranet", "created-by:terraform"], var.velero_volume_snapshot_failure_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

