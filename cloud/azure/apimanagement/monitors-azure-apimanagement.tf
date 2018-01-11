data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
             format("dd_monitoring:enabled,dd_azure_apimanagement:enabled,env:%s", var.environment) :
             "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "apimgt_status" {
  name    = "[${var.environment}] API Management status is not ok on {{name}}"
  message = "${var.message}"

  query = <<EOF
      avg(last_5m):avg:azure.apimanagement_service.status{${data.template_file.filter.rendered}} by {resource_group,region,name} < 1
      EOF
  type  = "metric alert"

  thresholds {
    critical = 1
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_failed_requests" {
  name    = "[${var.environment}] API Management {{name}} too much failed requests"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.apimanagement_service.failed_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() * 100
    ) > ${var.failed_requests_threshold_critical}
    EOF

  thresholds {
    critical  = "${var.failed_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_other_requests" {
  name    = "[${var.environment}] API Management {{name}} too much other requests"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.apimanagement_service.other_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() * 100
    ) > ${var.other_requests_threshold_critical}
    EOF

  thresholds {
    critical  = "${var.other_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_unauthorized_requests" {
  name    = "[${var.environment}] API Management {{name}} too much unauthorized requests"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.apimanagement_service.unauthorized_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() * 100
    ) > ${var.unauthorized_requests_threshold_critical}
    EOF

  thresholds {
    critical  = "${var.unauthorized_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "apimgt_successful_requests" {
  name    = "[${var.environment}] API Management {{name}} successful requests rate too low"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.apimanagement_service.successful_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() /
      avg:azure.apimanagement_service.total_requests{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count() * 100
    ) < ${var.successful_requests_threshold_critical}
    EOF

  thresholds {
    critical  = "${var.successful_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:apimanagement", "team:azure", "provider:azure"]
}
