# Monitors related to services
resource "datadog_monitor" "service_cpu_utilization" {
  count   = var.service_cpu_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ECS Service CPU Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.service_cpu_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.service_cpu_utilization_time_aggregator}(${var.service_cpu_utilization_timeframe}):
      avg:aws.ecs.cpuutilization${module.filter-tags.query_alert} by {region,servicename}
    > ${var.service_cpu_utilization_threshold_critical}
EOQ


  monitor_thresholds {
    critical = var.service_cpu_utilization_threshold_critical
    warning  = var.service_cpu_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:ecs", "team:claranet", "created-by:terraform", "category:service"], var.service_cpu_utilization_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "service_memory_utilization" {
  count   = var.service_memory_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ECS Service Memory Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.service_memory_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.service_memory_utilization_time_aggregator}(${var.service_memory_utilization_timeframe}):
      avg:aws.ecs.memory_utilization${module.filter-tags.query_alert} by {region,servicename}
    > ${var.service_memory_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.service_memory_utilization_threshold_critical
    warning  = var.service_memory_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:ecs", "team:claranet", "created-by:terraform", "category:service"], var.service_memory_utilization_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "service_missing_tasks" {
  count   = var.service_missing_tasks_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ECS Service not healthy enough {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.service_missing_tasks_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.service_missing_tasks_time_aggregator}(${var.service_missing_tasks_timeframe}):
    avg:aws.ecs.service.running{${var.filter_tags}} by {region,servicename} / avg:aws.ecs.service.desired{${var.filter_tags}} by {region,servicename}
  * 100 < ${var.service_missing_tasks_threshold_critical}
EOQ


  monitor_thresholds {
    critical = var.service_missing_tasks_threshold_critical
    warning  = var.service_missing_tasks_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:ecs", "team:claranet", "created-by:terraform", "category:service"], var.service_missing_tasks_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}
