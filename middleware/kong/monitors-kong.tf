#
# Service Check
#
resource "datadog_monitor" "not_responding" {
  count   = var.not_responding_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kong does not respond"
  message = coalesce(var.not_responding_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kong.can_connect"${module.filter-tags.service_check}.by("kong_host","kong_port").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.not_responding_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  no_data_timeframe   = var.not_responding_no_data_timeframe
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:middleware", "provider:kong", "resource:kong", "team:claranet", "created-by:terraform"], var.not_responding_extra_tags)
}

resource "datadog_monitor" "treatment_limit" {
  count   = var.treatment_limit_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kong exceeded its treatment limit {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.treatment_limit_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.treatment_limit_time_aggregator}(${var.treatment_limit_timeframe}):
    ( min:kong.connections_handled${module.filter-tags.query_alert} by {host} - min:kong.connections_accepted${module.filter-tags.query_alert} by {host} )
    / min:kong.connections_handled${module.filter-tags.query_alert} by {host} * 100
    > ${var.treatment_limit_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.treatment_limit_threshold_warning
    critical = var.treatment_limit_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:middleware", "provider:kong", "resource:kong", "team:claranet", "created-by:terraform"], var.treatment_limit_extra_tags)
}

