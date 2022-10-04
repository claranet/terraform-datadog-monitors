resource "datadog_monitor" "ark_schedules_monitor" {
  count   = var.ark_schedules_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Ark backup failed"
  type    = "query alert"
  message = coalesce(var.ark_schedules_monitor_message, var.message)

  query = <<EOQ
    sum(${var.ark_schedules_monitor_timeframe}):min:ark.ark_backup_failure_total${module.filter-tags.query_alert} by {schedule}.as_count() > 1
EOQ

  monitor_thresholds {
    critical = 1
    warning  = 0
  }

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  new_group_delay   = var.new_group_delay
  no_data_timeframe = var.ark_schedules_monitor_no_data_timeframe

  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(module.monitor-tags.tags, var.ark_schedules_extra_tags)
}

