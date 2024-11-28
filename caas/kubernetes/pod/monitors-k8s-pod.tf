resource "datadog_monitor" "pod_monitoring_status" {
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[{{kube_cluster_name.name}}] Dummy monitor to verify if the data is available"
  message = var.message
  type    = "query alert"

  query = <<EOQ
    sum(last_5m):
      sum:kubernetes.pods.running${module.filter-tags.query_alert} by {kube_cluster_name,kube_namespace}
      < 0
EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay
  new_group_delay  = var.new_group_delay

  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags)
}

resource "datadog_monitor" "pod_phase_status" {
  count   = var.pod_phase_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[{{kube_cluster_name.name}}] [{{kube_namespace.name}}] K8s pod {{pod_name.name}} phase is {{pod_phase.name}}"
  message = coalesce(var.pod_phase_status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.pod_phase_status_time_aggregator}(${var.pod_phase_status_timeframe}):
      default_zero(sum:kubernetes_state.pod.status_phase${module.filter-tags-phase.query_alert} by {${local.pod_status_group_by}}) > 0
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
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.pod_phase_status_extra_tags)
}

resource "datadog_monitor" "error_warning" {
  count   = var.error_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[{{kube_cluster_name.name}}] K8s pod {{pod_name.name}} is {{reason.name}} on namespace {{kube_namespace.name}}"
  message = coalesce(var.error_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
    ${var.error_time_aggregator}(${var.error_timeframe}):
      default_zero(sum:kubernetes_state.container.status_report.count.waiting${module.filter-tags-nocontainercreating.query_alert} by {${local.pod_group_by}})
    > ${var.error_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.error_threshold_warning
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

resource "datadog_monitor" "error_critical" {
  count   = var.error_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[{{kube_cluster_name.name}}] K8s pod {{pod_name.name}} is {{reason.name}} on namespace {{kube_namespace.name}}"
  message = coalesce(var.error_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.error_time_aggregator}(${var.error_timeframe}):
      default_zero(sum:kubernetes_state.container.status_report.count.waiting${module.filter-tags-nocontainercreating.query_alert} by {${local.pod_group_by}})
    > ${var.error_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.error_threshold_critical
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

resource "datadog_monitor" "restarts_warning" {
  count   = var.restarts_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[{{kube_cluster_name.name}}] K8s pod {{pod_name.name}} on namespace {{kube_namespace.name}} has restarted multiple times in the last ${var.restarts_timeframe}"
  message = coalesce(var.restarts_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
    change(${var.restarts_time_aggregator}(${var.restarts_timeframe}),${var.restarts_timeframe}):
      sum:kubernetes.containers.restarts${module.filter-tags.query_alert} by {${local.pod_granular}}
    > ${var.restarts_threshold_warning}
EOQ

  monitor_thresholds {
    critical = var.restarts_threshold_warning
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

  tags = concat(local.common_tags, var.tags, var.restarts_extra_tags)
}

resource "datadog_monitor" "restarts_critical" {
  count   = var.restarts_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[{{kube_cluster_name.name}}] K8s pod {{pod_name.name}} on namespace {{kube_namespace.name}} has restarted multiple times in the last ${var.restarts_timeframe}"
  message = coalesce(var.restarts_message, var.message)
  type    = "query alert"

  query = <<EOQ
    change(${var.restarts_time_aggregator}(${var.restarts_timeframe}),${var.restarts_timeframe}):
      sum:kubernetes.containers.restarts${module.filter-tags.query_alert} by {${local.pod_granular}}
    > ${var.restarts_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.restarts_threshold_critical
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

  tags = concat(local.common_tags, var.tags, var.restarts_extra_tags)
}
