resource "datadog_monitor" "pod_phase_status" {
  count   = "${var.pod_phase_status_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod phase status failed"
  type    = "metric alert"
  message = "${coalesce(var.pod_phase_status_message, var.message)}"

  query = <<EOQ
    ${var.pod_phase_status_time_aggregator}(${var.pod_phase_status_timeframe}):
      sum:kubernetes_state.pod.status_phase${module.filter-tags-phase.query_alert} by {namespace} > 0
  EOQ

  thresholds {
    critical = 0
  }

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.pod_phase_status_silenced}"
  tags     = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-pod", "team:claranet", "created-by:terraform", "${var.pod_phase_status_extra_tags}"]
}

resource "datadog_monitor" "error" {
  count   = "${var.error_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod errors {{#is_alert}}{{{comparator}}} {{threshold}} times ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} times ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.error_message, var.message)}"

  query = <<EOQ
    ${var.error_time_aggregator}(${var.error_timeframe}):
      sum:kubernetes_state.container.status_report.count.waiting${module.filter-tags-nocrashloopbackoff.query_alert} by {namespace,reason}.as_count()
    >= ${var.error_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.error_threshold_critical}"
    warning  = "${var.error_threshold_warning}"
  }

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.error_silenced}"
  tags     = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-pod", "team:claranet", "created-by:terraform", "${var.error_extra_tags}"]
}

resource "datadog_monitor" "crashloopbackoff" {
  count   = "${var.crashloopbackoff_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod CrashLoopBackOff"
  type    = "metric alert"
  message = "${coalesce(var.crashloopbackoff_message, var.message)}"

  query = <<EOQ
    change(${var.crashloopbackoff_time_aggregator}(${var.crashloopbackoff_timeframe}),${var.crashloopbackoff_timeframe}):
      max:kubernetes_state.container.status_report.count.waiting${module.filter-tags-crashloopbackoff.query_alert} by {namespace}.as_count()
    > ${var.crashloopbackoff_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.crashloopbackoff_threshold_critical}"
    warning  = "${var.crashloopbackoff_threshold_warning}"
  }

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.crashloopbackoff_silenced}"
  tags     = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-pod", "team:claranet", "created-by:terraform", "${var.crashloopbackoff_extra_tags}"]
}
