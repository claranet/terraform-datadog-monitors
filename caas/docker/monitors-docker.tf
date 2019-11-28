#
# Service Check
#
resource "datadog_monitor" "not_responding" {
  count   = var.not_responding_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Docker does not respond"
  message = coalesce(var.not_responding_message, var.message)
  type    = "service check"

  query = <<EOQ
    "docker.service_up"${module.filter-tags.service_check}.by("host").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.not_responding_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.not_responding_no_data_timeframe
  notify_no_data      = var.not_responding_notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:docker", "provider:docker", "resource:docker", "team:claranet", "created-by:terraform"], var.not_responding_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "memory_used" {
  count   = var.memory_used_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Docker Container Memory Used {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.memory_used_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.memory_used_time_aggregator}(${var.memory_used_timeframe}):
      avg:docker.mem.in_use${module.filter-tags.query_alert} by {container_name} * 100
    > ${var.memory_used_threshold_critical}
EOQ

  thresholds = {
    warning  = var.memory_used_threshold_warning
    critical = var.memory_used_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:docker", "provider:docker", "resource:docker", "team:claranet", "created-by:terraform"], var.memory_used_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

