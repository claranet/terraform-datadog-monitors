# Percentage of Notification Failure
resource "datadog_monitor" "notification_failure" {
  count   = var.notification_failure_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SNS Notification Failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "query alert"
  message = coalesce(var.notification_failure_message, var.message)

  query = <<EOQ
  sum(${var.notification_failure_timeframe}):
      default(avg:aws.sns.number_of_notifications_failed${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 0) / (
      default(avg:aws.sns.number_of_notifications_delivered${module.filter-tags.query_alert} by {region,loadbalancername}.as_rate(), 1))
      * 100 > ${var.notification_failure_threshold_critical}
EOQ

  thresholds = {
    critical = var.notification_failure_threshold_critical
    warning  = var.notification_failure_threshold_warning
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:sqs", "team:claranet", "created-by:terraform"], var.notification_failure_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}