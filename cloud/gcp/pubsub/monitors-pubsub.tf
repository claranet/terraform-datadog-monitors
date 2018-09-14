#
# Sending Operations Count
#
resource "datadog_monitor" "sending_operations_count" {
  count   = "${var.sending_operations_count_enabled ? 1 : 0}"
  name    = "[${var.environment}] GCP pubsub sending messages operations {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.sending_operations_count_message, var.message)}"

  type = "query alert"

  query = <<EOF
  ${var.sending_operations_count_time_aggregator}(${var.sending_operations_count_timeframe}):
    default(avg:gcp.pubsub.topic.send_message_operation_count{${var.filter_tags}} by {topic_id}.as_count(), 0)
    <= ${var.sending_operations_count_threshold_critical}
EOF

  thresholds {
    critical = "${var.sending_operations_count_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.sending_operations_count_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "team:claranet", "created-by:terraform", "${var.sending_operations_count_extra_tags}"]
}

#
# Unavailable Sending Operations Count
#
resource "datadog_monitor" "unavailable_sending_operations_count" {
  count   = "${var.unavailable_sending_operations_count_enabled ? 1 : 0}"
  name    = "[${var.environment}] GCP pubsub sending messages with result unavailable {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.unavailable_sending_operations_count_message, var.message)}"

  type = "query alert"

  query = <<EOF
  ${var.unavailable_sending_operations_count_time_aggregator}(${var.unavailable_sending_operations_count_timeframe}):
    default(avg:gcp.pubsub.topic.send_message_operation_count{${var.filter_tags},response_code:unavailable} by {topic_id}.as_count(), 0) 
    >= ${var.unavailable_sending_operations_count_threshold_critical}
EOF

  thresholds {
    warning  = "${var.unavailable_sending_operations_count_threshold_warning}"
    critical = "${var.unavailable_sending_operations_count_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.unavailable_sending_operations_count_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:pubsub", "team:claranet", "created-by:terraform", "${var.unavailable_sending_operations_count_extra_tags}"]
}
