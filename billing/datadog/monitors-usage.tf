resource "datadog_monitor" "host_basic_anomaly" {
  count   = var.host_basic_anomaly_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Datadog Host estimated usage anomaly detected"
  message = coalesce(var.host_basic_anomaly_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.host_basic_anomaly_time_aggregator}(${var.host_basic_anomaly_timeframe}):
    anomalies(avg:datadog.estimated_usage.hosts${module.filter-tags.query_alert} by {child_org_name},
              '${var.host_basic_anomaly_detection_algorithm}',
              ${var.host_basic_anomaly_deviations},
              direction='${var.host_basic_anomaly_direction}',
              alert_window='${var.host_basic_anomaly_alert_window}',
              interval=${var.host_basic_anomaly_interval},
              count_default_zero='${var.host_basic_anomaly_count_default_zero}',
              )
  >= ${var.host_basic_anomaly_threshold_critical}
EOQ

  thresholds = {
    critical = var.host_basic_anomaly_threshold_critical
  }

  threshold_windows = {
    trigger_window  = var.host_basic_anomaly_alert_window
    recovery_window = var.host_basic_anomaly_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:datadog", "provider:billing", "resource:estimated-usage", "team:claranet", "created-by:terraform"], var.host_basic_anomaly_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "host_agile_anomaly" {
  count   = var.host_agile_anomaly_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Datadog Host estimated usage seasonal anomaly detected"
  message = coalesce(var.host_agile_anomaly_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.host_agile_anomaly_time_aggregator}(${var.host_agile_anomaly_timeframe}):
    anomalies(avg:datadog.estimated_usage.hosts${module.filter-tags.query_alert} by {child_org_name},
              '${var.host_agile_anomaly_detection_algorithm}',
              ${var.host_agile_anomaly_deviations},
              direction='${var.host_agile_anomaly_direction}',
              alert_window='${var.host_agile_anomaly_alert_window}',
              interval=${var.host_agile_anomaly_interval},
              count_default_zero='${var.host_agile_anomaly_count_default_zero}',
              seasonality='${var.host_agile_anomaly_seasonality}'
              )
  >= ${var.host_agile_anomaly_threshold_critical}
EOQ

  thresholds = {
    critical = var.host_agile_anomaly_threshold_critical
  }

  threshold_windows = {
    trigger_window  = var.host_agile_anomaly_alert_window
    recovery_window = var.host_agile_anomaly_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:datadog", "provider:billing", "resource:estimated-usage", "team:claranet", "created-by:terraform"], var.host_agile_anomaly_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "host_change" {
  count   = var.host_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Datadog Host estimated usage daily change alert"
  message = coalesce(var.host_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
  pct_change(${var.host_change_time_aggregator}(${var.host_change_timeframe}),last_1d):
    avg:datadog.estimated_usage.hosts${module.filter-tags.query_alert} by {child_org_name}.rollup(avg, 86400)
  >= ${var.host_change_threshold_critical}
EOQ

  thresholds = {
    warning  = var.host_change_threshold_warning
    critical = var.host_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:datadog", "provider:billing", "resource:estimated-usage", "team:claranet", "created-by:terraform"], var.host_change_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

resource "datadog_monitor" "host_timeshift" {
  count   = var.host_timeshift_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Datadog Host estimated usage daily timeshift alert"
  message = coalesce(var.host_timeshift_message, var.message)
  type    = "query alert"

  # this one is little tricky but this is a test to simulate same behavior as change monitor above using timeshift
  # TODO change "day_before" with "month_before" and 86400 also
  query = <<EOQ
  ${var.host_timeshift_time_aggregator}(${var.host_timeshift_timeframe}):
    default(
      (
        avg:datadog.estimated_usage.hosts${module.filter-tags.query_alert} by {child_org_name}.rollup(avg, 86400) -
        day_before(
          avg:datadog.estimated_usage.hosts${module.filter-tags.query_alert} by {child_org_name}.rollup(avg, 86400)
        )
      ) / 
      avg:datadog.estimated_usage.hosts${module.filter-tags.query_alert} by {child_org_name}.rollup(avg, 86400)
    * 100, 0)
  >= ${var.host_timeshift_threshold_critical}
EOQ

  thresholds = {
    warning  = var.host_timeshift_threshold_warning
    critical = var.host_timeshift_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:datadog", "provider:billing", "resource:estimated-usage", "team:claranet", "created-by:terraform"], var.host_timeshift_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

