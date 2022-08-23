resource "datadog_monitor" "apiserver" {
  count   = var.apiserver_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes API server does not respond"
  message = coalesce(var.apiserver_message, var.message)

  type = "service check"

  query = <<EOQ
    "kube_apiserver_controlplane.up"${module.filter-tags.service_check}.last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.apiserver_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.apiserver_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.apiserver_extra_tags)
}

