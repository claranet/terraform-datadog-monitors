resource "datadog_monitor" "ELB_no_healthy_instances" {
  count   = var.elb_no_healthy_instance_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB healthy instances {{#is_alert}}is at 0{{/is_alert}}{{#is_warning}}is at {{value}}%%{{/is_warning}}"
  message = coalesce(var.elb_no_healthy_instance_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.elb_no_healthy_instance_time_aggregator}(${var.elb_no_healthy_instance_timeframe}): (
      sum:aws.elb.healthy_host_count.minimum${module.filter-tags.query_alert} by {region,loadbalancername} / (
      sum:aws.elb.healthy_host_count.minimum${module.filter-tags.query_alert} by {region,loadbalancername} +
      sum:aws.elb.un_healthy_host_count.maximum${module.filter-tags.query_alert} by {region,loadbalancername} )
    ) * 100 < 1
EOQ

  thresholds = {
    critical = 1
    warning  = var.elb_no_healthy_instance_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.elb_no_healthy_instance_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"], var.elb_no_healthy_instance_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "ELB_too_much_4xx" {
  count   = var.elb_4xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB 4xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.elb_4xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    sum(${var.elb_4xx_timeframe}):
      default(avg:aws.elb.httpcode_elb_4xx${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 0) / (
      default(avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.elb_4xx_threshold_critical}
EOQ

  thresholds = {
    warning  = var.elb_4xx_threshold_warning
    critical = var.elb_4xx_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  no_data_timeframe   = var.elb_4xx_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"], var.elb_4xx_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "ELB_too_much_5xx" {
  count   = var.elb_5xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB 5xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.elb_5xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    sum(${var.elb_5xx_timeframe}):
      default(avg:aws.elb.httpcode_elb_5xx${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 0) / (
      default(avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.elb_5xx_threshold_critical}
EOQ

  thresholds = {
    warning  = var.elb_5xx_threshold_warning
    critical = var.elb_5xx_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  no_data_timeframe   = var.elb_5xx_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"], var.elb_5xx_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "ELB_too_much_4xx_backend" {
  count   = var.elb_backend_4xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB backend 4xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.elb_backend_4xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    sum(${var.elb_backend_4xx_timeframe}):
      default(avg:aws.elb.httpcode_backend_4xx${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 0) / (
      default(avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.elb_backend_4xx_threshold_critical}
EOQ

  thresholds = {
    warning  = var.elb_backend_4xx_threshold_warning
    critical = var.elb_backend_4xx_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  no_data_timeframe   = var.elb_backend_4xx_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"], var.elb_backend_4xx_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "ELB_too_much_5xx_backend" {
  count   = var.elb_backend_5xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB backend 5xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.elb_backend_5xx_message, var.message)
  type    = "query alert"

  query = <<EOQ
    sum(${var.elb_backend_5xx_timeframe}):
      default(avg:aws.elb.httpcode_backend_5xx${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 0) / (
      default(avg:aws.elb.request_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.elb_backend_5xx_threshold_critical}
EOQ

  thresholds = {
    warning  = var.elb_backend_5xx_threshold_warning
    critical = var.elb_backend_5xx_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  no_data_timeframe   = var.elb_backend_5xx_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"], var.elb_backend_5xx_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "ELB_backend_latency" {
  count   = var.elb_backend_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB latency too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.elb_backend_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.elb_backend_latency_time_aggregator}(${var.elb_backend_latency_timeframe}):
      default(avg:aws.elb.latency${module.filter-tags.query_alert} by {region,loadbalancername}, 0)
    > ${var.elb_backend_latency_critical}
EOQ

  thresholds = {
    warning  = var.elb_backend_latency_warning
    critical = var.elb_backend_latency_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  no_data_timeframe   = var.elb_backend_latency_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elb", "team:claranet", "created-by:terraform"], var.elb_backend_latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

