resource "datadog_monitor" "ALB_no_healthy_instances" {
  count   = var.alb_no_healthy_instances_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ALB healthy instances {{#is_alert}}is at 0{{/is_alert}}{{#is_warning}}is at {{value}}%%{{/is_warning}}"
  message = coalesce(var.alb_no_healthy_instances_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.alb_no_healthy_instances_time_aggregator}(${var.alb_no_healthy_instances_timeframe}): (
      sum:aws.applicationelb.healthy_host_count.minimum${module.filter-tags.query_alert} by {region,loadbalancer} / (
      sum:aws.applicationelb.healthy_host_count.minimum${module.filter-tags.query_alert} by {region,loadbalancer} +
      sum:aws.applicationelb.un_healthy_host_count.maximum${module.filter-tags.query_alert} by {region,loadbalancer} )
    ) * 100 < 1
EOQ

  monitor_thresholds {
    critical = 1
    warning  = var.alb_no_healthy_instances_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.alb_no_healthy_instances_no_data_timeframe
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"], var.alb_no_healthy_instances_extra_tags)
}

resource "datadog_monitor" "ALB_latency" {
  count   = var.latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ALB latency {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.latency_time_aggregator}(${var.latency_timeframe}):
      default(avg:aws.applicationelb.target_response_time.average${module.filter-tags.query_alert} by {region,loadbalancer}, 0)
    > ${var.latency_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.latency_threshold_critical
    warning  = var.latency_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"], var.latency_extra_tags)
}

resource "datadog_monitor" "ALB_httpcode_5xx" {
  count   = var.httpcode_alb_5xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ALB HTTP code 5xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.httpcode_alb_5xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.httpcode_alb_5xx_time_aggregator}(${var.httpcode_alb_5xx_timeframe}):
      default(avg:aws.applicationelb.httpcode_elb_5xx${module.filter-tags.query_alert} by {region,loadbalancer}.as_rate(), 0) / (
      default(avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.httpcode_alb_5xx_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.httpcode_alb_5xx_threshold_critical
    warning  = var.httpcode_alb_5xx_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"], var.httpcode_alb_5xx_extra_tags)
}

resource "datadog_monitor" "ALB_httpcode_4xx" {
  count   = var.httpcode_alb_4xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ALB HTTP code 4xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.httpcode_alb_4xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.httpcode_alb_4xx_time_aggregator}(${var.httpcode_alb_4xx_timeframe}):
      default(avg:aws.applicationelb.httpcode_elb_4xx${module.filter-tags.query_alert} by {region,loadbalancer}.as_rate(), 0) / (
      default(avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.httpcode_alb_4xx_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.httpcode_alb_4xx_threshold_critical
    warning  = var.httpcode_alb_4xx_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"], var.httpcode_alb_4xx_extra_tags)
}

resource "datadog_monitor" "ALB_httpcode_target_5xx" {
  count   = var.httpcode_target_5xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ALB target HTTP code 5xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.httpcode_target_5xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.httpcode_target_5xx_time_aggregator}(${var.httpcode_target_5xx_timeframe}):
      default(avg:aws.applicationelb.httpcode_target_5xx${module.filter-tags.query_alert} by {region,loadbalancer,targetgroup}.as_rate(), 0) / (
      default(avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer,targetgroup}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.httpcode_target_5xx_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.httpcode_target_5xx_threshold_critical
    warning  = var.httpcode_target_5xx_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"], var.httpcode_target_5xx_extra_tags)
}

resource "datadog_monitor" "ALB_httpcode_target_4xx" {
  count   = var.httpcode_target_4xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ALB target HTTP code 4xx {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.httpcode_target_4xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.httpcode_target_4xx_time_aggregator}(${var.httpcode_target_4xx_timeframe}):
      default(avg:aws.applicationelb.httpcode_target_4xx${module.filter-tags.query_alert} by {region,loadbalancer,targetgroup}.as_rate(), 0) / (
      default(avg:aws.applicationelb.request_count${module.filter-tags.query_alert} by {region,loadbalancer,targetgroup}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.httpcode_target_4xx_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.httpcode_target_4xx_threshold_critical
    warning  = var.httpcode_target_4xx_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:alb", "team:claranet", "created-by:terraform"], var.httpcode_target_4xx_extra_tags)
}

