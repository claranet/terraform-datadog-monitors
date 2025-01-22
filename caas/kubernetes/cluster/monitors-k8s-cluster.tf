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
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.apiserver_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.apiserver_extra_tags)
}

resource "datadog_monitor" "heartbeat" {
  count   = var.heartbeat_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kubernetes cluster heartbeat alert on {{kube_cluster_name}}"
  message = coalesce(var.heartbeat_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.heartbeat_time_aggregator}(${var.heartbeat_timeframe}):
    sum:kubernetes.pods.running${module.filter-tags.query_alert} by {kube_cluster_name} > 1000000
EOQ

  monitor_thresholds {
    critical = 1000000 # high threshold to handle no data only
  }

  new_group_delay     = var.new_group_delay
  notify_no_data      = true
  no_data_timeframe   = var.heartbeat_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.heartbeat_extra_tags)
}
