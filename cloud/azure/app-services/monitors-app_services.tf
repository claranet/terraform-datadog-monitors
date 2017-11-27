data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_storage:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

# Monitoring App Services response time
resource "datadog_monitor" "appservices_response_time" {
  name    = "[${var.environment}] App Services response time > ${var.response_time_threshold_critical}s on {{name}}"
  type    = "metric alert"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.app_services.average_response_time{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) >= ${var.response_time_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.response_time_threshold_warning}"
    critical = "${var.response_time_threshold_critical}"
  }

  notify_no_data      = true  # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = ["env:${var.environment}", "resource:appservices", "team:azure", "provider:azure"]
}

# Monitoring App Services memory usage
resource "datadog_monitor" "appservices_memory_usage_count" {
  name    = "[${var.environment}] App Services memory usage > ${ceil(var.memory_usage_threshold_critical/1000000)}MiB on {{name}}"
  type    = "metric alert"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.app_services.memory_working_set{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) >= ${var.memory_usage_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.memory_usage_threshold_warning}"
    critical = "${var.memory_usage_threshold_critical}"
  }

  notify_no_data      = true                                      # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = ["env:${var.environment}", "resource:appservices", "team:azure", "provider:azure"]
}

# Monitoring App Services 404 errors rate
resource "datadog_monitor" "appservices_http_404_errors_count" {
  name    = "[${var.environment}] App Services HTTP errors > ${var.http_404_errors_count_rate_limit} limit on {{name}}"
  type    = "metric alert"
  message = "${var.message}"

  query = <<EOF
    max(last_5m): (
      per_minute(avg:azure.app_services.http404{${data.template_file.filter.rendered}}.as_rate()) by {resource_group,region,name}
    ) > ${var.http_404_errors_count_rate_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.http_404_errors_count_rate_threshold_warning}"
    critical = "${var.http_404_errors_count_rate_threshold_critical}"
  }

  notify_no_data      = false # Will NOT notify when no data is received
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = ["env:${var.environment}", "resource:appservices", "team:azure", "provider:azure"]
}

# Monitoring App Services HTTP 2xx status pages rate
resource "datadog_monitor" "appservices_http_2xx_status_rate" {
  name    = "[${var.environment}] App Services Too much non 2xx HTTP status in response to the requests on {{name}}"
  type    = "metric alert"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.app_services.http2xx{${data.template_file.filter.rendered}}.as_count() /
        avg:azure.app_services.http2xx{${data.template_file.filter.rendered}}.as_count() by {resource_group,region,name}
    ) < ${var.http_2xx_status_rate_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.http_2xx_status_rate_threshold_warning}"
    critical = "${var.http_2xx_status_rate_threshold_critical}"
  }

  notify_no_data      = false  # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = ["env:${var.environment}", "resource:appservices", "team:azure", "provider:azure"]
}
