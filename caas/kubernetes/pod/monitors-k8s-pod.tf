resource "datadog_monitor" "pod_phase_status" {
  count   = var.pod_phase_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod phase status failed"
  message = coalesce(var.pod_phase_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.pod_phase_status_time_aggregator}(${var.pod_phase_status_timeframe}):
      default(sum:kubernetes_state.pod.status_phase${module.filter-tags-phase.query_alert} by {${local.pod_status_group_by}}, 0) > 0
EOQ

  monitor_thresholds {
    critical = 0
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay
  new_group_delay  = var.new_group_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.pod_phase_status_extra_tags)
}

resource "datadog_monitor" "error" {
  count   = var.error_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod waiting errors"
  message = coalesce(var.error_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.error_time_aggregator}(${var.error_timeframe}):
      sum:kubernetes_state.container.waiting${module.filter-tags-nocontainercreating.query_alert} by {${local.pod_group_by}}
    > ${var.error_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.error_threshold_critical
    warning  = var.error_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.error_extra_tags)
}

resource "datadog_monitor" "terminated" {
  count   = var.terminated_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod terminated abnormally"
  message = coalesce(var.terminated_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.terminated_time_aggregator}(${var.terminated_timeframe}):
      sum:kubernetes_state.container.status_report.count.terminated${module.filter-tags-nocontainercreating.query_alert} by {${local.pod_group_by}}
    > ${var.terminated_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.terminated_threshold_critical
    warning  = var.terminated_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.terminated_extra_tags)
}

resource "datadog_monitor" "pod_container_killed_by_oom" {
  count   = var.pod_container_killed_by_oom_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod {{pod_name}} container {{kube_container_name}} killed by OOM on {{kube_cluster_name}}"
  message = coalesce(var.pod_container_killed_by_oom_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.pod_container_killed_by_oom_time_aggregator}(${var.pod_container_killed_by_oom_timeframe}):
      avg:container.memory.oom_events${module.filter-tags.query_alert} by {pod_name,kube_container_name,kube_cluster_name}
    > ${var.pod_container_killed_by_oom_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.pod_container_killed_by_oom_threshold_warning
    critical = var.pod_container_killed_by_oom_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.pod_container_killed_by_oom_extra_tags)
}

resource "datadog_monitor" "pod_frequently_restarted" {
  count   = var.pod_frequently_restarted_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pods in {{kube_replica_set}} frequently restarted on {{kube_cluster_name}}"
  message = coalesce(var.pod_frequently_restarted_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    change(${var.pod_frequently_restarted_time_aggregator}(${var.pod_frequently_restarted_timeframe}), ${var.pod_frequently_restarted_timeframe}):
      max:kubernetes_state.container.restarts${module.filter-tags.query_alert} by {kube_replica_set,kube_namespace,kube_cluster_name}
    >= ${var.pod_frequently_restarted_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.pod_frequently_restarted_threshold_warning
    critical = var.pod_frequently_restarted_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay
  new_group_delay  = var.new_group_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.pod_frequently_restarted_extra_tags)
}
