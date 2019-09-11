resource "datadog_monitor" "datadog_zookeeper_process_down" {
  count   = var.zookeeper_process_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Zookeeper process is down"
  message = coalesce(var.zookeeper_process_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.zookeeper_process_time_aggregator}(${var.zookeeper_process_timeframe}):
    min:system.processes.number${module.filter-tags-check-process.query_alert} by {host} < 1
EOQ

  thresholds = {
    critical = 1
  }

  notify_no_data      = false
  evaluation_delay    = 15
  new_host_delay      = 300
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:process", "provider:process-check", "resource:custom", "team:claranet", "created-by:terraform"], var.zookeeper_process_extra_tags)
}

resource "datadog_monitor" "datadog_monitor_zookeeper_latency" {
  count   = var.zookeeper_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Zookeeper latency {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.zookeeper_latency_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.zookeeper_latency_time_aggregator}(${var.zookeeper_latency_timeframe}): (
     zookeeper.avg_latency${module.filter-tags.query_alert} by {host}) > ${var.zookeeper_latency_threshold_critical}
EOQ

  thresholds = {
    warning  = var.zookeeper_latency_threshold_warning
    critical = var.zookeeper_latency_threshold_critical
  }

  notify_no_data      = false
  evaluation_delay    = 15
  new_host_delay      = 300
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:zookeeper", "resource:zookeeper", "team:claranet", "created-by:terraform"], var.zookeeper_latency_availability_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}
