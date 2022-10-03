#
# Sending Operations Count
#
resource "datadog_monitor" "sending_operations_count" {
  count   = var.sending_operations_count_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Pub/Sub Topic sending messages operations {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.sending_operations_count_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.sending_operations_count_time_aggregator}(${var.sending_operations_count_timeframe}):
    default(avg:gcp.pubsub.topic.send_message_operation_count{${var.filter_tags}} by {topic_id}.as_count(), 0)
    <= ${var.sending_operations_count_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.sending_operations_count_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "category:topic", "team:claranet", "created-by:terraform"], var.sending_operations_count_extra_tags)
}

#
# Unavailable Sending Operations Count
#
resource "datadog_monitor" "unavailable_sending_operations_count" {
  count   = var.unavailable_sending_operations_count_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Pub/Sub Topic sending messages with result unavailable {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.unavailable_sending_operations_count_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.unavailable_sending_operations_count_time_aggregator}(${var.unavailable_sending_operations_count_timeframe}):
    default(avg:gcp.pubsub.topic.send_message_operation_count{${var.filter_tags},response_code:unavailable} by {topic_id}.as_count(), 0)
    >= ${var.unavailable_sending_operations_count_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.unavailable_sending_operations_count_threshold_warning
    critical = var.unavailable_sending_operations_count_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "category:topic", "team:claranet", "created-by:terraform"], var.unavailable_sending_operations_count_extra_tags)
}

#
# Unavailable Sending Operations Ratio
#
resource "datadog_monitor" "unavailable_sending_operations_ratio" {
  count   = var.unavailable_sending_operations_ratio_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Pub/Sub Topic ratio of sending messages with result unavailable {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.unavailable_sending_operations_ratio_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.unavailable_sending_operations_ratio_time_aggregator}(${var.unavailable_sending_operations_ratio_timeframe}):
   (100 * default(sum:gcp.pubsub.topic.send_message_operation_count{${var.filter_tags},response_code:unavailable} by {topic_id}.as_rate(), 0))
    /
    default(sum:gcp.pubsub.topic.send_message_operation_count{${var.filter_tags}} by {topic_id}.as_rate(), 0)
    >= ${var.unavailable_sending_operations_ratio_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.unavailable_sending_operations_ratio_threshold_warning
    critical = var.unavailable_sending_operations_ratio_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "category:topic", "team:claranet", "created-by:terraform"], var.unavailable_sending_operations_ratio_extra_tags)
}
