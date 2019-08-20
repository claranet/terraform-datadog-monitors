resource "datadog_monitor" "app_error_rate" {
  count   = var.app_error_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] New Relic Error rate {{#is_alert}}{{{comparator}}} {{threshold}}errs/min ({{value}}errs/min){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}errs/min ({{value}}errs/min){{/is_warning}}"
  message = coalesce(var.app_error_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.app_error_rate_time_aggregator}(${var.app_error_rate_timeframe}):
      avg:new_relic.errors.all.errors_per_minute${module.filter-tags.query_alert} by {application}
    > ${var.app_error_rate_threshold_critical}
EOQ

  thresholds = {
    warning  = var.app_error_rate_threshold_warning
    critical = var.app_error_rate_threshold_critical
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

  tags = concat(["env:${var.environment}", "type:saas", "provider:new-relic", "resource:new-relic", "team:claranet", "created-by:terraform"], var.app_error_rate_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "app_apdex_score" {
  count   = var.app_apdex_score_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] New Relic Apdex score ratio {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.app_apdex_score_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.app_apdex_score_time_aggregator}(${var.app_apdex_score_timeframe}):
      avg:new_relic.apdex.score${module.filter-tags.query_alert} by {application}
    < ${var.app_apdex_score_threshold_critical}
EOQ

  thresholds = {
    warning  = var.app_apdex_score_threshold_warning
    critical = var.app_apdex_score_threshold_critical
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

  tags = concat(["env:${var.environment}", "type:saas", "provider:new-relic", "resource:new-relic", "team:claranet", "created-by:terraform"], var.app_apdex_score_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

#
# No Data
#
resource "datadog_monitor" "data_sent" {
  count   = var.data_sent_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] New Relic application has no-data"
  message = coalesce(var.data_sent_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.data_sent_time_aggregator}(${var.data_sent_timeframe}):
      avg:new_relic.apdex.score${module.filter-tags.query_alert} by {application}
    < ${var.data_sent_threshold_critical}
EOQ

  thresholds = {
    # No alert for this monitor, just send notification in case of no-data
    critical = var.data_sent_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.data_sent_no_data_timeframe
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:saas", "provider:new-relic", "resource:new-relic", "team:claranet", "created-by:terraform"], var.data_sent_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}
