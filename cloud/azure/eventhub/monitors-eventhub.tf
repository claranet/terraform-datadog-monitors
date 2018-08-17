resource "datadog_monitor" "eventhub_status" {
  name    = "[${var.environment}] Event Hub is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
    ${var.status_time_aggregator}(${var.status_timeframe}): (
       avg:azure.eventhub_namespaces.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) != 1
  EOF

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:eventhub", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "eventhub_failed_requests" {
  name    = "[${var.environment}] Event Hub too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_requests_rate_message, var.message)}"

  query = <<EOF
        sum(${var.failed_requests_rate_timeframe}): (
          default(
            avg:azure.eventhub_namespaces.failed_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
            avg:azure.eventhub_namespaces.incoming_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count(),
          0) * 100
        ) > ${var.failed_requests_rate_thresold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.failed_requests_rate_thresold_critical}"
    warning  = "${var.failed_requests_rate_thresold_warning}"
  }

  silenced = "${var.failed_requests_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:eventhub", "team:claranet", "created-by:terraform", "${var.failed_requests_rate_extra_tags}"]
}

resource "datadog_monitor" "eventhub_errors" {
  name    = "[${var.environment}] Event Hub too many errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.errors_rate_message, var.message)}"

  query = <<EOF
        sum(${var.errors_rate_timeframe}): (
          default(
            (
              avg:azure.eventhub_namespaces.internal_server_errors${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() +
              avg:azure.eventhub_namespaces.server_busy_errors${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() +
              avg:azure.eventhub_namespaces.other_errors${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
            ) / (
              avg:eventhub_namespaces.incoming_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
            ),
          0) * 100
        ) > ${var.errors_rate_thresold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.errors_rate_thresold_critical}"
    warning  = "${var.errors_rate_thresold_warning}"
  }

  silenced = "${var.errors_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:eventhub", "team:claranet", "created-by:terraform", "${var.errors_rate_extra_tags}"]
}
