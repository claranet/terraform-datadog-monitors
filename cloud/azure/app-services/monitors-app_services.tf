# Monitoring App Services response time
resource "datadog_monitor" "appservices_response_time" {
  count   = "${var.response_time_enabled ? 1 : 0}"
  name    = "[${var.environment}] App Services response time too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.response_time_message, var.message)}"

  query = <<EOF
    ${var.response_time_time_aggregator}(${var.response_time_timeframe}): (
      avg:azure.app_services.average_response_time${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.response_time_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.response_time_threshold_warning}"
    critical = "${var.response_time_threshold_critical}"
  }

  silenced = "${var.response_time_silenced}"

  notify_no_data      = true  # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-services", "team:claranet", "created-by:terraform", "${var.response_time_extra_tags}"]
}

# Monitoring App Services memory usage
resource "datadog_monitor" "appservices_memory_usage_count" {
  count   = "${var.memory_usage_enabled ? 1 : 0}"
  name    = "[${var.environment}] App Services memory usage {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.memory_usage_message, var.message)}"

  query = <<EOF
    ${var.memory_usage_time_aggregator}(${var.memory_usage_timeframe}): (
      avg:azure.app_services.memory_working_set${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.memory_usage_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.memory_usage_threshold_warning}"
    critical = "${var.memory_usage_threshold_critical}"
  }

  silenced = "${var.memory_usage_silenced}"

  notify_no_data      = true  # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-services", "team:claranet", "created-by:terraform", "${var.memory_usage_extra_tags}"]
}

# Monitoring App Services 5xx errors percent
resource "datadog_monitor" "appservices_http_5xx_errors_count" {
  count   = "${var.http_5xx_requests_enabled ? 1 : 0}"
  name    = "[${var.environment}] App Services HTTP 5xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.http_5xx_requests_message, var.message)}"

  query = <<EOF
    sum(${var.http_5xx_requests_timeframe}): (
      avg:azure.app_services.http5xx${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
      avg:azure.app_services.requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
    ) * 100 > ${var.http_5xx_requests_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.http_5xx_requests_threshold_warning}"
    critical = "${var.http_5xx_requests_threshold_critical}"
  }

  silenced = "${var.http_5xx_requests_silenced}"

  notify_no_data      = false # Will NOT notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-services", "team:claranet", "created-by:terraform", "${var.http_5xx_requests_extra_tags}"]
}

# Monitoring App Services 4xx errors percent
resource "datadog_monitor" "appservices_http_4xx_errors_count" {
  count   = "${var.http_4xx_requests_enabled ? 1 : 0}"
  name    = "[${var.environment}] App Services HTTP 4xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.http_4xx_requests_message, var.message)}"

  query = <<EOF
    sum(${var.http_4xx_requests_timeframe}): (
      avg:azure.app_services.http4xx${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() /
      avg:azure.app_services.requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
    ) * 100 > ${var.http_4xx_requests_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.http_4xx_requests_threshold_warning}"
    critical = "${var.http_4xx_requests_threshold_critical}"
  }

  silenced = "${var.http_4xx_requests_silenced}"

  notify_no_data      = false # Will NOT notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-services", "team:claranet", "created-by:terraform", "${var.http_4xx_requests_extra_tags}"]
}

# Monitoring App Services HTTP 2xx & 3xx status pages percent
resource "datadog_monitor" "appservices_http_success_status_rate" {
  count   = "${var.http_successful_requests_enabled ? 1 : 0}"
  name    = "[${var.environment}] App Services HTTP successful responses too low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.http_successful_requests_message, var.message)}"

  query = <<EOF
    sum(${var.http_successful_requests_timeframe}): (
      (avg:azure.app_services.http2xx${module.filter-tags.query_alert} by {resource_group,region,name}.as_count() +
       avg:azure.app_services.http3xx${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()) /
      avg:azure.app_services.requests${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
    ) * 100 < ${var.http_successful_requests_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.http_successful_requests_threshold_warning}"
    critical = "${var.http_successful_requests_threshold_critical}"
  }

  silenced = "${var.http_successful_requests_silenced}"

  notify_no_data      = false # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-services", "team:claranet", "created-by:terraform", "${var.http_successful_requests_extra_tags}"]
}
