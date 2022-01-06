# Service check
locals {
  common_tags = [
    "env:${var.environment}",
    "type:cloud",
    "provider:aws",
    "resource:ecs",
    "domain:${var.domain}",
    "created-by:terraform"
  ]
}

resource "datadog_monitor" "service_check" {
  count   = var.service_check_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Fargate service does not respond."
  message = coalesce(var.service_check_message, var.message)
  type    = "service check"

  query = <<EOQ
"fargate_check"${module.filter-tags.service_check}.last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.service_check_threshold_warning
    critical = 5
  }

  notify_audit = false
  locked       = false
  timeout_h    = 0

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  notify_no_data    = var.notify_no_data
  no_data_timeframe = var.service_check_no_data_timeframe
  renotify_interval = 0


  include_tags = true
  tags         = concat(["category:service"], local.common_tags, var.service_check_extra_tags)
}

resource "datadog_monitor" "cpu_utilization" {
  count   = var.cpu_utilization_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Fargate CPU Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.cpu_utilization_time_aggregator}(${var.cpu_utilization_timeframe}):
  avg:ecs.fargate.cpu.percent${module.filter-tags.query_alert} by {task_family, ecs_container_name}
> ${var.cpu_utilization_threshold_critical}
EOQ


  monitor_thresholds {
    critical = var.cpu_utilization_threshold_critical
    warning  = var.cpu_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["category:service"], local.common_tags, var.cpu_utilization_extra_tags)

}

resource "datadog_monitor" "memory_utilization" {
  count   = var.memory_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Fargate memory Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.memory_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
${var.memory_utilization_time_aggregator}(${var.memory_utilization_timeframe}):
  avg:ecs.fargate.mem.usage${module.filter-tags.query_alert} by {task_family, ecs_container_name} /
  avg:ecs.fargate.mem.limit${module.filter-tags.query_alert} by {task_family, ecs_container_name}
  * 100
> ${var.memory_utilization_threshold_critical}
EOQ


  monitor_thresholds {
    critical = var.memory_utilization_threshold_critical
    warning  = var.memory_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  require_full_window = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["category:service"], local.common_tags, var.memory_utilization_extra_tags)

}
