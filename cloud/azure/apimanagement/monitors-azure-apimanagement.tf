resource "datadog_monitor" "apimgt_status" {
  name    = "[${var.environment}] API Management is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
      ${var.status_time_aggregator}(${var.status_timeframe}):avg:azure.apimanagement_service.status${module.filter-tags.query_alert} by {resource_group,region,name} < 1
  EOF

  type = "metric alert"

  thresholds {
    critical = 1
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

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_failed_requests" {
  name    = "[${var.environment}] API Management too many failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_requests_message, var.message)}"

  query = <<EOF
    sum(${var.failed_requests_timeframe}): (
      avg:azure.apimanagement_service.failed_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() * 100
    ) > ${var.failed_requests_threshold_critical}
  EOF

  thresholds {
    critical = "${var.failed_requests_threshold_critical}"
    warning  = "${var.failed_requests_threshold_warning}"
  }

  silenced = "${var.failed_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_other_requests" {
  name    = "[${var.environment}] API Management too many other requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.other_requests_message, var.message)}"

  query = <<EOF
    sum(${var.other_requests_timeframe}): (
      avg:azure.apimanagement_service.other_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() * 100
    ) > ${var.other_requests_threshold_critical}
  EOF

  thresholds {
    critical = "${var.other_requests_threshold_critical}"
    warning  = "${var.other_requests_threshold_warning}"
  }

  silenced = "${var.other_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_unauthorized_requests" {
  name    = "[${var.environment}] API Management too many unauthorized requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.unauthorized_requests_message, var.message)}"

  query = <<EOF
    sum(${var.unauthorized_requests_timeframe}): (
      avg:azure.apimanagement_service.unauthorized_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() * 100
    ) > ${var.unauthorized_requests_threshold_critical}
  EOF

  thresholds {
    critical = "${var.unauthorized_requests_threshold_critical}"
    warning  = "${var.unauthorized_requests_threshold_warning}"
  }

  silenced = "${var.unauthorized_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_successful_requests" {
  name    = "[${var.environment}] API Management successful requests rate too low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.successful_requests_message, var.message)}"

  query = <<EOF
    sum(${var.successful_requests_timeframe}): (
      avg:azure.apimanagement_service.successful_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() * 100
    ) < ${var.successful_requests_threshold_critical}
  EOF

  thresholds {
    critical = "${var.successful_requests_threshold_critical}"
    warning  = "${var.successful_requests_threshold_warning}"
  }

  silenced = "${var.successful_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}
