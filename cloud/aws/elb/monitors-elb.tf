resource "datadog_monitor" "ELB_no_healthy_instances" {
  name    = "[${var.environment}] ELB no healthy instances"
  message = "${coalesce(var.elb_no_healthy_instance_message, var.message)}"

  query = <<EOF
    ${var.elb_no_healthy_instance_time_aggregator}(${var.elb_no_healthy_instance_timeframe}): (
      sum:aws.elb.healthy_host_count${module.filter-tags.query_alert} by {region,loadbalancername}
    ) < 1
  EOF

  type = "metric alert"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.elb_no_healthy_instance_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ELB_too_much_4xx" {
  name    = "[${var.environment}] ELB 4xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.elb_4xx_message, var.message)}"

  query = <<EOF
    sum(${var.elb_4xx_timeframe}): (
      default(
        avg:aws.elb.httpcode_elb_4xx${module.filter-tags.query_alert} by {region,loadbalancername}.as_count() /
        (avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_count() + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.elb_4xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_4xx_threshold_warning}"
    critical = "${var.elb_4xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.elb_4xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ELB_too_much_5xx" {
  name    = "[${var.environment}] ELB 5xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.elb_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.elb_5xx_timeframe}): (
      default(
        avg:aws.elb.httpcode_elb_5xx${module.filter-tags.query_alert} by {region,loadbalancername} /
        (avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername} + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.elb_5xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_5xx_threshold_warning}"
    critical = "${var.elb_5xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.elb_5xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ELB_too_much_4xx_backend" {
  name    = "[${var.environment}] ELB backend 4xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.elb_backend_4xx_message, var.message)}"

  query = <<EOF
    sum(${var.elb_backend_4xx_timeframe}): (
      default(
        avg:aws.elb.httpcode_backend_4xx${module.filter-tags.query_alert} by {region,loadbalancername} /
        (avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername} + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.elb_backend_4xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_4xx_threshold_warning}"
    critical = "${var.elb_backend_4xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.elb_backend_4xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ELB_too_much_5xx_backend" {
  name    = "[${var.environment}] ELB backend 5xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.elb_backend_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.elb_backend_5xx_timeframe}): (
      default(
        avg:aws.elb.httpcode_backend_5xx${module.filter-tags.query_alert} by {region,loadbalancername} /
        (avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername} + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.elb_backend_5xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_5xx_threshold_warning}"
    critical = "${var.elb_backend_5xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.elb_backend_5xx_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"]
}

resource "datadog_monitor" "ELB_backend_latency" {
  name    = "[${var.environment}] ELB latency too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.elb_backend_latency_message, var.message)}"

  query = <<EOF
    ${var.elb_backend_latency_time_aggregator}(${var.elb_backend_latency_timeframe}): (
        avg:aws.elb.latency${module.filter-tags.query_alert} by {region,loadbalancername}
    ) > ${var.elb_backend_latency_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_latency_warning}"
    critical = "${var.elb_backend_latency_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.elb_backend_latency_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"]
}
