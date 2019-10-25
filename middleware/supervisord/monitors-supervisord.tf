resource "datadog_monitor" "datadog_supervisord_process" {
  count   = var.supervisord_connect_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Supervisord process is down on {{host.name}} {{#is_alert}}{{{comparator}}} {{threshold}}({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.supervisord_connect_message, var.message)
  type    = "service check"

  query = <<EOQ
    "supervisord.can_connect"${module.filter-tags.service_check}.by("host").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.supervisord_connect_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:middleware", "provider:supervisord", "resource:supervisord", "team:claranet", "created-by:terraform"], var.supervisord_connect_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "datadog_supervisord_process_not_available" {
  count   = var.supervisord_process_not_available_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Supervisor status {{supervisord_process.name}} is not OK on {{host.name}} {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.supervisord_process_not_available_message, var.message)
  type    = "service check"

  query = <<EOQ
    "supervisord.process.status"${module.filter-tags.service_check}.by("host", "supervisord_process").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.supervisord_process_not_available_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:middleware", "provider:supervisord", "resource:supervisord", "team:claranet", "created-by:terraform"], var.supervisord_process_not_available_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}