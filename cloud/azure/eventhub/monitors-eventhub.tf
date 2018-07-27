data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_eventhub:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "eventhub_status" {
  name    = "[${var.environment}] Event Hub is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
    ${var.status_time_aggregator}(${var.status_timeframe}): (
       avg:azure.eventhub_namespaces.status{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) != 1
  EOF

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:eventhub", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "eventhub_failed_requests" {
  name    = "[${var.environment}] Event Hub too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_requests_rate_message, var.message)}"

  query = <<EOF
        sum(${var.failed_requests_rate_timeframe}): (
          default(
            avg:azure.eventhub_namespaces.failed_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() /
            avg:azure.eventhub_namespaces.incoming_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count(),
          0) * 100
        ) > ${var.failed_requests_rate_thresold_critical}
  EOF

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    critical = "${var.failed_requests_rate_thresold_critical}"
    warning  = "${var.failed_requests_rate_thresold_warning}"
  }

  silenced = "${var.failed_requests_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:eventhub", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "eventhub_errors" {
  name    = "[${var.environment}] Event Hub too many errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.errors_rate_message, var.message)}"

  query = <<EOF
        sum(${var.errors_rate_timeframe}): (
          default(
            (
              avg:azure.eventhub_namespaces.internal_server_errors{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() +
              avg:azure.eventhub_namespaces.server_busy_errors{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() +
              avg:azure.eventhub_namespaces.other_errors{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count()
            ) / (
              avg:eventhub_namespaces.incoming_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count()
            ),
          0) * 100
        ) > ${var.errors_rate_thresold_critical}
  EOF

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    critical = "${var.errors_rate_thresold_critical}"
    warning  = "${var.errors_rate_thresold_warning}"
  }

  silenced = "${var.errors_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:eventhub", "team:azure", "provider:azure"]
}
