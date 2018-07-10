data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
             format("dd_monitoring:enabled,dd_aws_alb:enabled,env:%s", var.environment) :
             "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "ALB_no_healthy_instances" {
  name    = "[${var.environment}] ALB no healthy instances"
  type    = "metric alert"
  message = "${coalesce(var.alb_no_healthy_instances_message, var.message)}"

  query = <<EOF
    ${var.alb_no_healthy_instances_time_aggregator}(${var.alb_no_healthy_instances_timeframe}): (
      min:aws.applicationelb.healthy_host_count{${data.template_file.filter.rendered}} by {region,loadbalancer}
    ) < 1
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    critical = 1
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.alb_no_healthy_instances_silenced}"

  tags = ["env:${var.environment}", "resource:alb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ALB_latency" {
  name    = "[${var.environment}] ALB latency {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOF
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (
      avg:aws.applicationelb.target_response_time.average{${data.template_file.filter.rendered}} by {region,loadbalancer}
    ) > ${var.latency_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

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

  tags = ["env:${var.environment}", "resource:alb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ALB_httpcode_5xx" {
  name    = "[${var.environment}] ALB HTTP code 5xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_alb_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_alb_5xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_alb_5xx{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_alb_5xx_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

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

  tags = ["env:${var.environment}", "resource:alb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ALB_httpcode_4xx" {
  name    = "[${var.environment}] ALB HTTP code 4xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_alb_4xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_alb_4xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_alb_4xx{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_alb_4xx_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

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

  tags = ["env:${var.environment}", "resource:alb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ALB_httpcode_target_5xx" {
  name    = "[${var.environment}] ALB target HTTP code 5xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_target_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_target_5xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_target_5xx{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_target_5xx_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

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

  tags = ["env:${var.environment}", "resource:alb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ALB_httpcode_target_4xx" {
  name    = "[${var.environment}] ALB target HTTP code 4xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = "${coalesce(var.httpcode_target_4xx_message, var.message)}"

  query = <<EOF
    sum(${var.httpcode_target_4xx_timeframe}): (
      default(
        avg:aws.applicationelb.httpcode_target_4xx{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() /
        (avg:aws.applicationelb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancer}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.httpcode_target_4xx_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

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

  tags = ["env:${var.environment}", "resource:alb", "team:aws", "provider:aws"]
}
