resource "datadog_monitor" "NLB_no_healthy_instances" {
  count   = "${var.nlb_no_healthy_instance_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] NLB healthy instances {{#is_alert}}is at 0{{/is_alert}}{{#is_warning}}is at {{value}}%{{/is_warning}}"
  message = "${coalesce(var.nlb_no_healthy_instance_message, var.message)}"

  query = <<EOQ
    ${var.nlb_no_healthy_instance_time_aggregator}(${var.nlb_no_healthy_instance_timeframe}): (
      sum:aws.networkelb.healthy_host_count.maximum${module.filter-tags.query_alert} by {region,loadbalancername} / (
      sum:aws.networkelb.healthy_host_count.maximum${module.filter-tags.query_alert} by {region,loadbalancername} +
      sum:aws.networkelb.un_healthy_host_count.maximum${module.filter-tags.query_alert} by {region,loadbalancername} )
    ) * 100 < 1
  EOQ

  type = "metric alert"

  thresholds {
    critical = 1
    warning  = 100
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.nlb_no_healthy_instance_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:nlb", "team:claranet", "created-by:terraform", "${var.nlb_no_healthy_instance_extra_tags}"]
}

resource "datadog_monitor" "NLB_too_much_reset" {
  count   = "${var.nlb_reset_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ELB 4xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.nlb_reset_message, var.message)}"

  query = <<EOQ
    sum(${var.nlb_reset_timeframe}):
      default(avg:aws.networkelb.tcptarget_reset_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 0) / (
      default(avg:aws.networkelb.active_flow_count${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate() + ${var.artificial_requests_count}, 1))
      * 100 > ${var.nlb_reset_threshold_critical}
  EOQ

  type = "metric alert"

  thresholds {
    warning  = "${var.nlb_reset_threshold_warning}"
    critical = "${var.nlb_reset_threshold_critical}"
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

  silenced = "${var.nlb_reset_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:nlb", "team:claranet", "created-by:terraform", "${var.nlb_reset_extra_tags}"]
}
