resource "datadog_monitor" "app_error_rate" {
  count   = "${var.app_error_rate_enabled == true && var.newrelic_direct == false}" ? 1 : 0
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
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "app_apdex_score" {
  count   = "${var.app_apdex_score_enabled == true && var.newrelic_direct == false}" ? 1 : 0
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
    ignore_changes = [silenced]
  }
}

resource "newrelic_alert_policy" "production_down" {
  count = var.newrelic_direct == true ? 1 : 0
  name  = "Production is Down"
}


resource "newrelic_nrql_alert_condition" "app_apdex_score_direct" {
  count       = "${var.app_apdex_score_enabled == true && var.newrelic_direct == true}" ? 1 : 0
  name        = "Apdex is low"
  description = var.message
  runbook_url = var.newrelic_runbook_url

  type                 = "static"
  policy_id            = newrelic_alert_policy.production_down[0].id
  violation_time_limit = "one_hour"
  value_function       = "single_value"

  nrql {
    query             = <<EOQ
      SELECT apdex(duration, t:0.5) FROM Transaction WHERE appName like ${var.appname_like}
EOQ
    evaluation_offset = 3
  }

  critical {
    operator              = "below"
    threshold             = var.app_apdex_score_threshold_critical
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "below"
    threshold             = var.app_apdex_score_threshold_warning
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}

