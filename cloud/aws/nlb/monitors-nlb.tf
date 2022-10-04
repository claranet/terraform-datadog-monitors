resource "datadog_monitor" "NLB_no_healthy_instances" {
  count   = var.nlb_no_healthy_instances_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] NLB healthy instances {{#is_alert}}is at 0{{/is_alert}}{{#is_warning}}is at {{value}}%%{{/is_warning}}"
  message = coalesce(var.nlb_no_healthy_instances_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.nlb_no_healthy_instances_time_aggregator}(${var.nlb_no_healthy_instances_timeframe}): (
      sum:aws.networkelb.healthy_host_count.minimum${module.filter-tags.query_alert} by {region,loadbalancer} / (
      sum:aws.networkelb.healthy_host_count.minimum${module.filter-tags.query_alert} by {region,loadbalancer} +
      sum:aws.networkelb.un_healthy_host_count.maximum${module.filter-tags.query_alert} by {region,loadbalancer} )
    ) * 100 < 1
EOQ

  monitor_thresholds {
    critical = 1
    warning  = var.nlb_no_healthy_instances_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.nlb_no_healthy_instances_no_data_timeframe
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:nlb", "team:claranet", "created-by:terraform"], var.nlb_no_healthy_instances_extra_tags)
}

