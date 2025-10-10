resource "datadog_monitor" "cpu_utilization" {
  count   = var.cpu_utilization_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] AWS MQ CPU Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.cpu_utilization_time_aggregator}(${var.cpu_utilization_timeframe}):
  avg:aws.amazonmq.system_cpu_utilization${module.filter-tags.query_alert} by {broker, env, region}
> ${var.cpu_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cpu_utilization_threshold_critical
    warning  = var.cpu_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.cpu_utilization_extra_tags)
}

resource "datadog_monitor" "memory_utilization" {
  count   = var.memory_utilization_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] AWS MQ Memory Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.memory_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.memory_utilization_time_aggregator}(${var.memory_utilization_timeframe}):
  100 * (avg:aws.amazonmq.rabbit_mqmem_used${module.filter-tags.query_alert} by {broker, env, region} / avg:aws.amazonmq.rabbit_mqmem_limit${module.filter-tags.query_alert} by {broker, env, region})
> ${var.memory_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.memory_utilization_threshold_critical
    warning  = var.memory_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.memory_utilization_extra_tags)
}

resource "datadog_monitor" "disk_free_limit" {
  count   = var.disk_free_limit_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] AWS MQ Disk Free limit High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.disk_free_limit_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.disk_free_limit_time_aggregator}(${var.disk_free_limit_timeframe}):
  100 * (avg:aws.amazonmq.rabbit_mqdisk_free_limit${module.filter-tags.query_alert} by {broker, env, region} / aws.amazonmq.rabbit_mqdisk_free${module.filter-tags.query_alert} by {broker, env, region})
> ${var.disk_free_limit_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.disk_free_limit_threshold_critical
    warning  = var.disk_free_limit_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.disk_free_limit_extra_tags)
}

resource "datadog_monitor" "consumer_count" {
  count   = var.consumer_count_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] AWS MQ Consumer count Low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.consumer_count_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.consumer_count_time_aggregator}(${var.consumer_count_timeframe}):
  avg:aws.amazonmq.consumer_count${module.filter-tags.query_alert} by {broker, env, region}
< ${var.consumer_count_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.consumer_count_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.consumer_count_extra_tags)
}

resource "datadog_monitor" "messages_ready" {
  count   = var.messages_ready_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] AWS MQ Messages ready High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.messages_ready_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.messages_ready_time_aggregator}(${var.messages_ready_timeframe}):
  avg:aws.amazonmq.message_ready_count${module.filter-tags.query_alert} by {broker, env, region}
> ${var.messages_ready_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.messages_ready_threshold_critical
    warning  = var.messages_ready_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.messages_ready_extra_tags)
}
