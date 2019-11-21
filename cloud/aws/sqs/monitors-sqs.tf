# Approximate Number of Visible Messages
resource "datadog_monitor" "visible_messages" {
  count   = var.visible_messages_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SQS Visible messages {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.visible_messages_message, var.message)

  query = <<EOQ
    ${var.visible_messages_time_aggregator}(${var.visible_messages_timeframe}):
        avg:aws.sqs.approximate_number_of_messages_visible${module.filter-tags.query_alert} by {region,queuename}
    > ${var.visible_messages_threshold_critical}
EOQ

  thresholds = {
    critical = var.visible_messages_threshold_critical
    warning  = var.visible_messages_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:sqs", "team:claranet", "created-by:terraform"], var.visible_messages_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Age of the Oldest Message
resource "datadog_monitor" "age_of_oldest_message" {
  count   = var.age_of_oldest_message_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SQS Age of the oldest message {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.age_of_oldest_message_message, var.message)

  query = <<EOQ
    ${var.age_of_oldest_message_time_aggregator}(${var.age_of_oldest_message_timeframe}):
      avg:aws.sqs.approximate_age_of_oldest_message${module.filter-tags.query_alert} by {region,queuename}
    > ${var.age_of_oldest_message_threshold_critical}
EOQ

  thresholds = {
    critical = var.age_of_oldest_message_threshold_critical
    warning  = var.age_of_oldest_message_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:sqs", "team:claranet", "created-by:terraform"], var.age_of_oldest_message_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}
