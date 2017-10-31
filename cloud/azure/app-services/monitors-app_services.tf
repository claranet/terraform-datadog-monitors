data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_appservices:enabled,env:%s", var.environment) : "*"}"
  }
}

# Monitoring App Services response time
resource "datadog_monitor" "appservices_response_time" {
  name               = "[${var.environment}] App Services response time {{value}}s is above ${var.response_time_threshold_critical}s"
  type               = "query alert"
  message            = "${var.message}"
  escalation_message = "${var.response_time_escalation_message}"

  query = <<EOF
    avg(last_${var.response_time_last_time_window_code}): (
      avg:azure.app_services.average_response_time{${data.template_file.filter.rendered}}
    ) >= ${var.response_time_threshold_critical}
  EOF

  evaluation_delay = "${var.response_time_appserv_eval_delay}"

  thresholds {
    warning  = "${var.response_time_threshold_warning}"
    critical = "${var.response_time_threshold_critical}"
  }

  notify_no_data      = true                                       # Will notify when no data is received
  renotify_interval   = "${var.response_time_renotify_interval}"
  require_full_window = "${var.response_time_require_full_window}"

  timeout_h    = "${var.response_time_timeout_h}"
  include_tags = "${var.response_time_include_tags}"

  tags = "${var.response_time_tags}"
}

# Monitoring App Services memory usage
resource "datadog_monitor" "appservices_memory_usage_count" {
  name               = "[${var.environment}] App Services memory usage {{value}} bytes is above ${ceil(var.memory_usage_threshold_critical/1000000)}MiB"
  type               = "query alert"
  message            = "${var.message}"
  escalation_message = "${var.memory_usage_escalation_message}"

  query = <<EOF
    avg(last_${var.memory_usage_last_time_window_code}): (
      avg:azure.app_services.memory_working_set{${data.template_file.filter.rendered}}
    ) >= ${var.memory_usage_threshold_critical}
  EOF

  evaluation_delay = "${var.memory_usage_appserv_eval_delay}"

  thresholds {
    warning  = "${var.memory_usage_threshold_warning}"
    critical = "${var.memory_usage_threshold_critical}"
  }

  notify_no_data      = true                                      # Will notify when no data is received
  renotify_interval   = "${var.memory_usage_renotify_interval}"
  require_full_window = "${var.memory_usage_require_full_window}"

  timeout_h    = "${var.memory_usage_timeout_h}"
  include_tags = "${var.memory_usage_include_tags}"

  tags = "${var.memory_usage_tags}"
}

# Monitoring App Services 404 errors rate
resource "datadog_monitor" "appservices_http_404_errors_count" {
  name               = "[${var.environment}] App Services {{value}} HTTP errors > ${var.http_404_errors_count_rate_limit} limit"
  type               = "query alert"
  message            = "${var.message}"
  escalation_message = "${var.http_404_errors_count_rate_escalation_message}"

  query = <<EOF
    max(last_${var.http_404_errors_count_rate_last_time_window_code}): (
      per_minute(avg:azure.app_services.http404{${data.template_file.filter.rendered}}.as_rate())
    ) > ${var.http_404_errors_count_rate_threshold_critical}
  EOF

  evaluation_delay = "${var.http_404_errors_count_rate_appserv_eval_delay}"

  thresholds {
    warning  = "${var.http_404_errors_count_rate_threshold_warning}"
    critical = "${var.http_404_errors_count_rate_threshold_critical}"
  }

  notify_no_data      = false                                                 # Will NOT notify when no data is received
  renotify_interval   = "${var.http_404_errors_count_rate_renotify_interval}"
  require_full_window = true

  timeout_h    = "${var.http_404_errors_count_rate_timeout_h}"
  include_tags = "${var.http_404_errors_count_rate_include_tags}"

  tags = "${var.http_404_errors_count_rate_tags}"
}

# Monitoring App Services HTTP 2xx status pages rate
resource "datadog_monitor" "appservices_http_2xx_status_rate" {
  name               = "[${var.environment}] App Services {{value}} Too much non 2xx HTTP status in response to the requests"
  type               = "query alert"
  message            = "${var.message}"
  escalation_message = "${var.http_2xx_status_rate_escalation_message}"

  query            = <<EOF
    avg(last_${var.http_2xx_status_rate_last_time_window_code}): (
      avg:azure.app_services.http2xx{${data.template_file.filter.rendered}}.as_count() /
        avg:azure.app_services.http2xx{${data.template_file.filter.rendered}}.as_count()
    ) < ${var.http_2xx_status_rate_threshold_critical}
  EOF

  evaluation_delay = "${var.http_2xx_status_rate_appserv_eval_delay}"

  thresholds {
    warning  = "${var.http_2xx_status_rate_threshold_warning}"
    critical = "${var.http_2xx_status_rate_threshold_critical}"
  }

  # Will notify when no data is received
  notify_no_data      = true
  renotify_interval   = "${var.http_2xx_status_rate_renotify_interval}"
  require_full_window = true

  timeout_h    = "${var.http_2xx_status_rate_timeout_h}"
  include_tags = "${var.http_2xx_status_rate_include_tags}"

  tags = "${var.http_2xx_status_rate_tags}"
}
