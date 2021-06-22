######################
# All Subscriptions #
######################

#
# oldest_unacked_message_age
#
resource "datadog_monitor" "oldest_unacked_message_age" {
  count   = var.oldest_unacked_message_age_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Pub/Sub Subscription oldest unacknowledged message {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.oldest_unacked_message_age_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.oldest_unacked_message_age_time_aggregator}(${var.oldest_unacked_message_age_timeframe}):
    avg:gcp.pubsub.subscription.oldest_unacked_message_age{${var.filter_tags}} by {subscription_id}
    >= ${var.oldest_unacked_message_age_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.oldest_unacked_message_age_threshold_warning
    critical = var.oldest_unacked_message_age_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "category:subscription", "team:claranet", "created-by:terraform"], var.oldest_unacked_message_age_extra_tags)
}

######################
# Push Subscriptions #
######################

#
# subscription_push_latency
#
resource "datadog_monitor" "subscription_push_latency" {
  count   = var.subscription_push_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Pub/Sub Subscription latency on push endpoint {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.subscription_push_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.subscription_push_latency_time_aggregator}(${var.subscription_push_latency_timeframe}):
    avg:gcp.pubsub.subscription.push_request_latencies.avg{${var.filter_tags}} by {subscription_id}
    >= ${var.subscription_push_latency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.subscription_push_latency_threshold_warning
    critical = var.subscription_push_latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "category:subscription", "team:claranet", "created-by:terraform"], var.subscription_push_latency_extra_tags)
}

#
# subscription_push_latency_anomaly
#
resource "datadog_monitor" "subscription_push_latency_anomaly" {
  count   = var.subscription_push_latency_anomaly_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Pub/Sub Subscription latency on push endpoint changed abnormally {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.subscription_push_latency_anomaly_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.subscription_push_latency_anomaly_time_aggregator}(${var.subscription_push_latency_anomaly_timeframe}):
    anomalies(
        avg:gcp.pubsub.subscription.push_request_latencies.avg{${var.filter_tags}} by {subscription_id}
        '${var.subscription_push_latency_anomaly_detection_algorithm}',
        avg: gcp.pubsub.subscription.push_request_latencies.sumsqdev{${var.filter_tags}} by {subscription_id},
        direction='${var.subscription_push_latency_anomaly_direction}',
        alert_window='${var.subscription_push_latency_anomaly_alert_window}',
        interval=${var.subscription_push_latency_anomaly_interval},
        count_default_zero='${var.subscription_push_latency_anomaly_count_default_zero}'
        ${var.subscription_push_latency_anomaly_seasonality == "agile" ? format(",seasonality='%s'", var.subscription_push_latency_anomaly_seasonality) : ""}
      )

    >= ${var.subscription_push_latency_anomaly_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.subscription_push_latency_anomaly_threshold_warning
    critical = var.subscription_push_latency_anomaly_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "category:subscription", "team:claranet", "created-by:terraform"], var.subscription_push_latency_anomaly_extra_tags)
}