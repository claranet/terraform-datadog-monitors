resource "datadog_monitor" "not_responding" {
  count   = var.zookeeper_not_responding_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Zookeeper service does not respond {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.zookeeper_not_responding_message, var.message)
  type    = "service check"

  query = <<EOQ
    "zookeeper.ruok"${module.filter-tags.service_check}.by(${join(",", formatlist("\"%s\"", var.not_responding_group_by))}).last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.not_responding_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.not_responding_no_data_timeframe
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.not_responding_notify_no_data
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.zookeeper_latency_availability_extra_tags)
}

resource "datadog_monitor" "datadog_monitor_zookeeper_latency" {
  count   = var.zookeeper_latency_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Zookeeper latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.zookeeper_latency_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.zookeeper_latency_time_aggregator}(${var.zookeeper_latency_timeframe}): (
     zookeeper.avg_latency${module.filter-tags.query_alert} by {${join(",", var.zookeeper_latency_group_by)}}) > ${var.zookeeper_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.zookeeper_latency_threshold_warning
    critical = var.zookeeper_latency_threshold_critical
  }

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.zookeeper_latency_availability_extra_tags)
}
