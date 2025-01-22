resource "datadog_monitor" "job" {
  count   = var.job_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes job failed"
  message = coalesce(var.job_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes_state.job.complete"${module.filter-tags.service_check}.by(${local.jobfailed_group_by}).last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.job_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.job_extra_tags)
}

resource "datadog_monitor" "cronjob" {
  count   = var.cronjob_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes cronjob scheduling failed"
  message = coalesce(var.cronjob_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes_state.cronjob.on_schedule_check"${module.filter-tags.service_check}.by(${local.cronjobfailed_group_by}).last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.cronjob_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.cronjob_extra_tags)
}

resource "datadog_monitor" "replica_available" {
  count   = var.replica_available_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Available replicas {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.replica_available_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.replica_available_time_aggregator}(${var.replica_available_timeframe}):
      max:kubernetes_state.deployment.replicas_desired${module.filter-tags.query_alert} by {${local.deployment_group_by}} -
      max:kubernetes_state.deployment.replicas_available${module.filter-tags.query_alert} by {${local.deployment_group_by}}
    + 1 < ${var.replica_available_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.replica_available_threshold_critical
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

  tags = concat(local.common_tags, var.tags, var.replica_available_extra_tags)
}

resource "datadog_monitor" "replica_ready" {
  count   = var.replica_ready_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Ready replicas {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.replica_ready_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.replica_ready_time_aggregator}(${var.replica_ready_timeframe}):
      max:kubernetes_state.replicaset.replicas_desired${module.filter-tags.query_alert} by {${local.replica_group_by}} -
      max:kubernetes_state.replicaset.replicas_ready${module.filter-tags.query_alert} by {${local.replica_group_by}}
    + 1 < ${var.replica_ready_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.replica_ready_threshold_critical
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

  tags = concat(local.common_tags, var.tags, var.replica_ready_extra_tags)
}

resource "datadog_monitor" "replica_current" {
  count   = var.replica_current_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Current replicas {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.replica_current_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.replica_current_time_aggregator}(${var.replica_current_timeframe}):
      max:kubernetes_state.replicaset.replicas_desired${module.filter-tags.query_alert} by {${local.replica_group_by}} -
      max:kubernetes_state.replicaset.replicas${module.filter-tags.query_alert} by {${local.replica_group_by}}
    + 1 < ${var.replica_current_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.replica_current_threshold_critical
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

  tags = concat(local.common_tags, var.tags, var.replica_current_extra_tags)
}

resource "datadog_monitor" "deployments_replica_too_low" {
  count   = var.deployments_replica_too_low_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Deployment {{kube_deployment}} replica too low on {{kube_cluster_name}}"
  message = coalesce(var.deployments_replica_too_low_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.deployments_replica_too_low_time_aggregator}(${var.deployments_replica_too_low_timeframe}):
      avg:kubernetes_state.deployment.replicas_available${module.filter-tags.query_alert} by {kube_deployment,kube_namespace,kube_cluster_name}
    - avg:kubernetes_state.deployment.replicas_desired${module.filter-tags.query_alert} by {kube_deployment,kube_namespace,kube_cluster_name}
    < ${var.deployments_replica_too_low_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.deployments_replica_too_low_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_group_delay  = var.new_group_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = false
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.deployments_replica_too_low_extra_tags)
}

resource "datadog_monitor" "daemonset_pods_not_ready" {
  count   = var.daemonset_pods_not_ready_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes DaemonSet {{kube_daemon_set}} not ready on {{kube_cluster_name}}"
  message = coalesce(var.daemonset_pods_not_ready_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.daemonset_pods_not_ready_time_aggregator}(${var.daemonset_pods_not_ready_timeframe}):
      sum:kubernetes_state.daemonset.ready${module.filter-tags.query_alert} by {kube_daemon_set,kube_cluster_name}
      / sum:kubernetes_state.daemonset.desired${module.filter-tags.query_alert} by {kube_daemon_set,kube_cluster_name}
    > ${var.daemonset_pods_not_ready_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.daemonset_pods_not_ready_threshold_critical
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

  tags = concat(local.common_tags, var.tags, var.daemonset_pods_not_ready_extra_tags)
}

resource "datadog_monitor" "statefulset_pods_not_ready" {
  count   = var.statefulset_pods_not_ready_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes StatefulSet {{kube_stateful_set}} not ready on {{kube_cluster_name}}"
  message = coalesce(var.statefulset_pods_not_ready_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.statefulset_pods_not_ready_time_aggregator}(${var.statefulset_pods_not_ready_timeframe}):
      avg:kubernetes_state.statefulset.ready${module.filter-tags.query_alert} by {kube_stateful_set,kube_namespace,kube_cluster_name}
      / avg:kubernetes_state.statefulset.desired${module.filter-tags.query_alert} by {kube_stateful_set,kube_namespace,kube_cluster_name}
      * 100
    < ${var.statefulset_pods_not_ready_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.statefulset_pods_not_ready_threshold_critical
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

  tags = concat(local.common_tags, var.tags, var.statefulset_pods_not_ready_extra_tags)
}

resource "datadog_monitor" "hpa_cannot_scaleup_further" {
  count   = var.hpa_cannot_scaleup_further_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes HPA Cannot Scale Out Further {{horizontalpodautoscaler}} on {{kube_cluster_name}}"
  message = coalesce(var.hpa_cannot_scaleup_further_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.hpa_cannot_scaleup_further_time_aggregator}(${var.hpa_cannot_scaleup_further_timeframe}):
      avg:kubernetes_state.hpa.current_replicas${module.filter-tags.query_alert} by {horizontalpodautoscaler,kube_namespace,kube_cluster_name} 
      * 100 
      / avg:kubernetes_state.hpa.max_replicas${module.filter-tags.query_alert} by {horizontalpodautoscaler,kube_namespace,kube_cluster_name}
    >= ${var.hpa_cannot_scaleup_further_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.hpa_cannot_scaleup_further_threshold_critical
    warning  = var.hpa_cannot_scaleup_further_threshold_warning
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

  tags = concat(local.common_tags, var.tags, var.hpa_cannot_scaleup_further_extra_tags)
}

resource "datadog_monitor" "pod_disruption_budget_not_respected" {
  count   = var.pod_disruption_budget_not_respected_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod Disruption Budget {{poddisruptionbudget}} not respected on {{kube_cluster_name}}"
  message = coalesce(var.pod_disruption_budget_not_respected_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.pod_disruption_budget_not_respected_time_aggregator}(${var.pod_disruption_budget_not_respected_timeframe}):
      avg:kubernetes_state.pdb.pods_healthy${module.filter-tags.query_alert} by {poddisruptionbudget,kube_namespace,kube_cluster_name}
      - avg:kubernetes_state.pdb.pods_desired${module.filter-tags.query_alert} by {poddisruptionbudget,kube_namespace,kube_cluster_name}
    < ${var.pod_disruption_budget_not_respected_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.pod_disruption_budget_not_respected_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_group_delay  = var.new_group_delay

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = false
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.pod_disruption_budget_not_respected_extra_tags)
}
