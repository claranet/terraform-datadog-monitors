# Monitors related to Supervisord
resource "datadog_monitor" "supervisord_status" {
  count   = var.supervisord_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Supervisord status does not respond {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.supervisord_status_message, var.message)
  type    = "service check"

  query = <<EOQ
    "supervisord.can_connect"${module.filter-tags.service_check}.by("host").last(6).count_by_status()
EOQ


  thresholds = {
    warning  = var.supervisord_status_threshold_warning
    critical = 5
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  no_data_timeframe   = var.supervisord_status_no_data_timeframe
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:middleware", "provider:supervisord", "resource:supervisord", "team:claranet", "created-by:terraform", "category:agent"], var.supervisord_status_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}