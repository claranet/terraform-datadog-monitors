# Monitors related to ECS Cluster
resource "datadog_monitor" "ecs_agent_status" {
  count   = var.agent_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ECS Agent disconnected {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.agent_status_message, var.message)
  type    = "service check"

  query = <<EOQ
    "aws.ecs.agent_connected"${module.filter-tags.service_check}.by("cluster","instance_id").last(6).count_by_status()
EOQ


  monitor_thresholds {
    warning  = var.agent_status_threshold_warning
    critical = 5
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.agent_status_no_data_timeframe
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:ecs", "team:claranet", "created-by:terraform", "category:agent"], var.agent_status_extra_tags)
}

resource "datadog_monitor" "cluster_cpu_utilization" {
  count   = var.cluster_cpu_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ECS Cluster CPU Utilization High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cluster_cpu_utilization_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cluster_cpu_utilization_time_aggregator}(${var.cluster_cpu_utilization_timeframe}):
      avg:aws.ecs.cluster.cpuutilization${module.filter-tags.query_alert} by {region,clustername}
    > ${var.cluster_cpu_utilization_threshold_critical}
EOQ


  monitor_thresholds {
    critical = var.cluster_cpu_utilization_threshold_critical
    warning  = var.cluster_cpu_utilization_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:ecs", "team:claranet", "created-by:terraform", "category:cluster"], var.cluster_cpu_utilization_extra_tags)

}

resource "datadog_monitor" "cluster_memory_reservation" {
  count   = var.cluster_memory_reservation_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ECS Cluster Memory Reservation High {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cluster_memory_reservation_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.cluster_memory_reservation_time_aggregator}(${var.cluster_memory_reservation_timeframe}):
      avg:aws.ecs.cluster.memory_reservation${module.filter-tags.query_alert} by {region,clustername}
    > ${var.cluster_memory_reservation_threshold_critical}
EOQ


  monitor_thresholds {
    critical = var.cluster_memory_reservation_threshold_critical
    warning  = var.cluster_memory_reservation_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:ecs", "team:claranet", "created-by:terraform", "category:cluster"], var.cluster_memory_reservation_extra_tags)
}
