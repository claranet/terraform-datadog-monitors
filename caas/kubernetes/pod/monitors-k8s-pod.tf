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
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes Pod waiting errors"
  type    = "metric alert"
  message = "${coalesce(var.error_message, var.message)}"

  query = <<EOQ
    ${var.error_time_aggregator}(${var.error_timeframe}):
      sum:kubernetes_state.container.status_report.count.waiting${module.filter-tags-nocontainercreating.query_alert} by {namespace,reason}.as_count()
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
