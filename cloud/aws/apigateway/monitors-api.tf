# Monitoring Api Gateway latency
resource "datadog_monitor" "API_Gateway_latency" {
  name    = "[${var.environment}] API Gateway latency {{#is_alert}}{{comparator}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.apigateway.latency{${var.filter_tags}} by {region,apiname}
    ) > ${var.latency_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.latency_threshold_warning}"
    critical = "${var.latency_threshold_critical}"
  }

  notify_no_data      = true  # Will notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.latency_silenced}"

  tags = ["env:${var.environment}", "resource:apigateway", "team:aws", "provider:aws"]
}

# Monitoring API Gateway 5xx errors percent
resource "datadog_monitor" "API_http_5xx_errors_count" {
  name    = "[${var.environment}] API Gateway HTTP 5xx errors {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.http_5xx_requests_message, var.message)}"

  query = <<EOF
    sum(last_5m): (
      default(
        avg:aws.apigateway.5xxerror{${var.filter_tags}} by {region,apiname}.as_count() /
        (avg:aws.apigateway.count{${var.filter_tags}} by {region,apiname}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.http_5xx_requests_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.http_5xx_requests_threshold_warning}"
    critical = "${var.http_5xx_requests_threshold_critical}"
  }

  notify_no_data      = false # Will NOT notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  silenced = "${var.http_5xx_requests_silenced}"

  tags = ["env:${var.environment}", "resource:apigateway", "team:aws", "provider:aws"]
}

# Monitoring API Gateway 4xx errors percent
resource "datadog_monitor" "API_http_4xx_errors_count" {
  name    = "[${var.environment}] API Gateway HTTP 4xx errors {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.http_4xx_requests_message, var.message)}"

  query = <<EOF
    sum(last_5m): (
      default(
        avg:aws.apigateway.4xxerror{${var.filter_tags}} by {region,apiname}.as_count() /
        (avg:aws.apigateway.count{${var.filter_tags}} by {region,apiname}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.http_4xx_requests_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.http_4xx_requests_threshold_warning}"
    critical = "${var.http_4xx_requests_threshold_critical}"
  }

  notify_no_data      = false # Will NOT notify when no data is received
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  silenced = "${var.http_4xx_requests_silenced}"

  tags = ["env:${var.environment}", "resource:apigateway", "team:aws", "provider:aws"]
}
