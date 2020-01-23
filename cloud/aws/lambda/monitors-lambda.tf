# Errors Percent
resource "datadog_monitor" "pct_errors" {
  count   = var.pct_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Lambda Percentage of errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.pct_errors_message, var.message)

  query = <<EOQ
    ${var.pct_errors_time_aggregator}(${var.pct_errors_timeframe}):
      default(
        (default(sum:aws.lambda.errors${module.filter-tags.query_alert} by {region,functionname}.as_count(),0)
        /
        default(sum:aws.lambda.invocations${module.filter-tags.query_alert} by {region,functionname}.as_count(),1))
        * 100,0)
      > ${var.pct_errors_threshold_critical}
  EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  thresholds = {
    critical = var.pct_errors_threshold_critical
    warning  = var.pct_errors_threshold_warning
  }

  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:lambda", "team:claranet", "created-by:terraform"], var.pct_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Errors Absolute Value
resource "datadog_monitor" "errors" {
  count   = var.errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Lambda Number of errors {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.errors_message, var.message)

  query = <<EOQ
    ${var.errors_time_aggregator}(${var.errors_timeframe}):
      default(sum:aws.lambda.errors${module.filter-tags.query_alert} by {region,functionname}.as_count(),0)
      > ${var.errors_threshold_critical}
  EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  thresholds = {
    critical = var.errors_threshold_critical
    warning  = var.errors_threshold_warning
  }

  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:lambda", "team:claranet", "created-by:terraform"], var.errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Throttles
resource "datadog_monitor" "throttles" {
  count   = var.throttles_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Lambda Invocations throttled due to concurrent limit reached {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.throttles_message, var.message)

  query = <<EOQ
    ${var.throttles_time_aggregator}(${var.throttles_timeframe}):
      default(sum:aws.lambda.throttles${module.filter-tags.query_alert} by {region,functionname}.as_count(),0)
      > ${var.throttles_threshold_critical}
  EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  thresholds = {
    critical = var.throttles_threshold_critical
    warning  = var.throttles_threshold_warning
  }

  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:lambda", "team:claranet", "created-by:terraform"], var.throttles_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# INVOCATIONS
resource "datadog_monitor" "invocations" {
  count   = var.invocations_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Lambda Number of invocations {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.invocations_message, var.message)

  query = <<EOQ
    ${var.invocations_time_aggregator}(${var.invocations_timeframe}):
      default(sum:aws.lambda.invocations${module.filter-tags.query_alert} by {region,functionname}.as_count(),0)
      <= ${var.invocations_threshold_critical}
  EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  thresholds = {
    critical = var.invocations_threshold_critical
    warning  = var.invocations_threshold_warning
  }

  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.invocations_no_data_timeframe
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false



  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:lambda", "team:claranet", "created-by:terraform"], var.invocations_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}
