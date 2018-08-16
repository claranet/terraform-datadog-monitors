resource "datadog_monitor" "ALB_no_healthy_instances" {
  name    = "[${var.environment}] ALB no healthy instances"
  type    = "metric alert"
  message = "${coalesce(var.alb_no_healthy_instances_message, var.message)}"

  query = <<EOF
    ${var.alb_no_healthy_instances_time_aggregator}(${var.alb_no_healthy_instances_timeframe}): (
      sum:aws.applicationelb.healthy_host_count${module.filter-tags.query_alert} by {region,loadbalancer}
    ) < 1
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = 1
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.alb_no_healthy_instances_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ALB_latency" {
  name    = "[${var.environment}] ALB latency {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOF
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (
      avg:aws.applicationelb.target_response_time.average${module.filter-tags.query_alert} by {region,loadbalancer}
    ) > ${var.latency_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.latency_threshold_critical}"
    warning  = "${var.latency_threshold_warning}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.latency_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ALB_httpcode_5xx" {
  name    = "[${var.environment}] ALB HTTP code 5xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_alb_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_alb_5xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_alb_5xx${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_alb_5xx_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.httpcode_alb_5xx_threshold_critical}"
    warning  = "${var.httpcode_alb_5xx_threshold_warning}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.httpcode_alb_5xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ALB_httpcode_4xx" {
  name    = "[${var.environment}] ALB HTTP code 4xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_alb_4xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_alb_4xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_alb_4xx${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_alb_4xx_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.httpcode_alb_4xx_threshold_critical}"
    warning  = "${var.httpcode_alb_4xx_threshold_warning}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.httpcode_alb_4xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ALB_httpcode_target_5xx" {
  name    = "[${var.environment}] ALB target HTTP code 5xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_target_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_target_5xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_target_5xx${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_target_5xx_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.httpcode_target_5xx_threshold_critical}"
    warning  = "${var.httpcode_target_5xx_threshold_warning}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.httpcode_target_5xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ALB_httpcode_target_4xx" {
  name    = "[${var.environment}] ALB target HTTP code 4xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_target_4xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_target_4xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_target_4xx${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_target_4xx_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.httpcode_target_4xx_threshold_critical}"
    warning  = "${var.httpcode_target_4xx_threshold_warning}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.httpcode_target_4xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"]
}
