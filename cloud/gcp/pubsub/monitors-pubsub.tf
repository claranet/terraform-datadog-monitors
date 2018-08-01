#
# FILTER
#
data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
              format("project_id:%s", var.project_id) :
             "${var.filter_tags_custom}"}"
  }
}

#
# Sending Operations Count
#
resource "datadog_monitor" "sending_operations_count" {
  name    = "[${var.environment}] GCP pubsub sending messages operations {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.sending_operations_count_message, var.message)}"

  type = "query alert"

  query = <<EOF
  ${var.sending_operations_count_time_aggregator}(${var.sending_operations_count_timeframe}):
    default(avg:gcp.pubsub.topic.send_message_operation_count{${data.template_file.filter.rendered}} by {topic_id}.as_count(), 0)
    <= ${var.sending_operations_count_threshold_critical}
EOF

  thresholds {
    critical = "${var.sending_operations_count_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  no_data_timeframe   = 45
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.sending_operations_count_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "resource:pubsub",
    "env:${var.environment}",
    "created_by:terraform",
    "${var.sending_operations_count_extra_tags}",
  ]
}

#
# Unavailable Sending Operations Count
#
resource "datadog_monitor" "unavailable_sending_operations_count" {
  name    = "[${var.environment}] GCP pubsub sending messages with result unavailable {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.unavailable_sending_operations_count_message, var.message)}"

  type = "query alert"

  query = <<EOF
  ${var.unavailable_sending_operations_count_time_aggregator}(${var.unavailable_sending_operations_count_timeframe}):
    default(avg:gcp.pubsub.topic.send_message_operation_count{${data.template_file.filter.rendered},response_code:unavailable} by {topic_id}.as_count(), 0) 
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
  no_data_timeframe   = 25
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.unavailable_sending_operations_count_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "resource:pubsub",
    "env:${var.environment}",
    "created_by:terraform",
    "${var.unavailable_sending_operations_count_extra_tags}",
  ]
}
