#
# 4XX Errors
#
resource "datadog_monitor" "error_rate_4xx" {
  name    = "[${var.environment}] GCP LB 4xx errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.error_rate_4xx_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.error_rate_4xx_time_aggregator}(${var.error_rate_4xx_timeframe}):
    avg:gcp.loadbalancing.https.request_count{${var.filter_tags},response_code_class:400} by {forwarding_rule_name}.as_count().fill(zero)
    /
    (avg:gcp.loadbalancing.https.request_count{${var.filter_tags}} by {forwarding_rule_name}.as_count().fill(zero) + ${var.error_rate_4xx_artificial_request} ) * 100
  > ${var.error_rate_4xx_threshold_critical}
EOF

  thresholds {
    critical = "${var.error_rate_4xx_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.error_rate_4xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:lb", "team:claranet", "created-by:terraform", "${var.error_rate_4xx_extra_tags}"]
}

#
# 5XX Errors
#
resource "datadog_monitor" "error_rate_5xx" {
  name    = "[${var.environment}] GCP LB 5xx errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.error_rate_5xx_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.error_rate_5xx_time_aggregator}(${var.error_rate_5xx_timeframe}):
    avg:gcp.loadbalancing.https.request_count{${var.filter_tags},response_code_class:500} by {forwarding_rule_name}.as_count().fill(zero)
    /
    (avg:gcp.loadbalancing.https.request_count{${var.filter_tags}} by {forwarding_rule_name}.as_count().fill(zero) + ${var.error_rate_5xx_artificial_request} ) * 100
  > ${var.error_rate_5xx_threshold_critical}
EOF

  thresholds {
    critical = "${var.error_rate_5xx_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.error_rate_5xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:lb", "team:claranet", "created-by:terraform", "${var.error_rate_5xx_extra_tags}"]
}

#
# Latency
#
resource "datadog_monitor" "latency" {
  name    = "[${var.environment}] GCP LB latency {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  type = "query alert"

  query = <<EOF
  ${var.latency_time_aggregator}(${var.latency_timeframe}):
    min:gcp.loadbalancing.https.total_latencies.avg{${var.filter_tags}} by {forwarding_rule_name}
  > ${var.latency_threshold_critical}
EOF

  thresholds {
    warning  = "${var.latency_threshold_warning}"
    critical = "${var.latency_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.latency_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:lb", "team:claranet", "created-by:terraform", "${var.latency_extra_tags}"]
}

#
# Backend Latency
#
resource "datadog_monitor" "backend_latency" {
  name    = "[${var.environment}] GCP LB backend latency {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.backend_latency_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.backend_latency_time_aggregator}(${var.backend_latency_timeframe}):
    min:gcp.loadbalancing.https.backend_latencies.avg{${var.filter_tags}} by {forwarding_rule_name}
  > ${var.backend_latency_threshold_critical}
EOF

  thresholds {
    warning  = "${var.backend_latency_threshold_warning}"
    critical = "${var.backend_latency_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.backend_latency_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:lb", "team:claranet", "created-by:terraform", "${var.backend_latency_extra_tags}"]
}

#
# Request Count
#
resource "datadog_monitor" "request_count" {
  name    = "[${var.environment}] GCP LB Requests count increased abruptly {{#is_alert}}{{value}}%{{/is_alert}}{{#is_warning}}{{value}}%{{/is_warning}}"
  message = "${coalesce(var.request_count_message, var.message)}"

  type = "query alert"

  query = <<EOF
  pct_change(${var.request_count_time_aggregator}(${var.request_count_timeframe}),${var.request_count_timeshift}):
    avg:gcp.loadbalancing.https.request_count{${var.filter_tags}} by {forwarding_rule_name}.as_count().fill(zero)
  > ${var.request_count_threshold_critical}
EOF

  thresholds {
    warning  = "${var.request_count_threshold_warning}"
    critical = "${var.request_count_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.request_count_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:lb", "team:claranet", "created-by:terraform", "${var.request_count_extra_tags}"]
}
