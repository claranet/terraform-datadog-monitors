#
# System memory usage ratio
#
resource "datadog_monitor" "system_memory_usage_ratio" {
  count   = var.system_memory_usage_ratio_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Memorystore Redis system memory usage ratio {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.system_memory_usage_ratio_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.system_memory_usage_ratio_time_aggregator}(${var.system_memory_usage_ratio_timeframe}):
      avg:gcp.redis.stats.memory.system_memory_usage_ratio{${var.filter_tags}} by {instance_id,role}
    * 100 > ${var.system_memory_usage_ratio_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.system_memory_usage_ratio_threshold_critical
    warning  = var.system_memory_usage_ratio_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.system_memory_usage_ratio_no_data_timeframe
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:memorystore", "team:claranet", "created-by:terraform", "engine:redis"], var.system_memory_usage_ratio_extra_tags)
}
