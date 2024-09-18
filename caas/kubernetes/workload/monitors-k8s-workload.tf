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

