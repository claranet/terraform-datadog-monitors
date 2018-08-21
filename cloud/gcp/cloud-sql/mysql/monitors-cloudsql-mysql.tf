#
# Replication Lag
#
resource "datadog_monitor" "replication_lag" {
  name    = "[${var.environment}] Cloud SQL MySQL Replication Lag {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.replication_lag_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.replication_lag_time_aggregator}(${var.replication_lag_timeframe}):
    avg:gcp.cloudsql.database.mysql.replication.seconds_behind_master{${var.filter_tags}}
    by {database_id}
  > ${var.replication_lag_threshold_critical}
EOF

  thresholds {
    critical = "${var.replication_lag_threshold_critical}"
    warning  = "${var.replication_lag_threshold_warning}"
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

  silenced = "${var.replication_lag_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform", "engine:mysql", "${var.replication_lag_extra_tags}"]
}

#
# Queries Anomaly
#
resource "datadog_monitor" "queries_changing_anomaly" {
  name    = "[${var.environment}] Cloud SQL MySQL Queries Count changed abnormally"
  message = "${coalesce(var.queries_changing_anomaly_message, var.message)}"

  type = "query alert"

  query = <<EOF
    ${var.queries_changing_anomaly_time_aggregator}(${var.queries_changing_anomaly_timeframe}):
      anomalies(
        avg:gcp.cloudsql.database.mysql.queries{${var.filter_tags}} by {database_id}.as_count(),
        '${var.queries_changing_anomaly_detection_algorithm}',
        ${var.queries_changing_anomaly_deviations},
        direction='${var.queries_changing_anomaly_direction}',
        alert_window='${var.queries_changing_anomaly_alert_window}',
        interval=${var.queries_changing_anomaly_interval},
        count_default_zero='${var.queries_changing_anomaly_count_default_zero}',
        seasonality='${var.queries_changing_anomaly_seasonality}'
      )
      > ${var.queries_changing_anomaly_threshold_critical}
EOF

  thresholds {
    warning           = "${var.queries_changing_anomaly_threshold_warning}"
    critical          = "${var.queries_changing_anomaly_threshold_critical}"
    critical_recovery = "${var.queries_changing_anomaly_threshold_critical_recovery}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.queries_changing_anomaly_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform", "engine:mysql", "${var.queries_changing_anomaly_extra_tags}"]
}

#
# Questions Anomaly
#
resource "datadog_monitor" "questions_changing_anomaly" {
  name    = "[${var.environment}] Cloud SQL MySQL Questions Count changed abnormally"
  message = "${coalesce(var.questions_changing_anomaly_message, var.message)}"

  type = "query alert"

  query = <<EOF
    ${var.questions_changing_anomaly_time_aggregator}(${var.questions_changing_anomaly_timeframe}):
      anomalies(
        avg:gcp.cloudsql.database.mysql.questions{${var.filter_tags}} by {database_id},
        '${var.questions_changing_anomaly_detection_algorithm}',
        ${var.questions_changing_anomaly_deviations},
        direction='${var.questions_changing_anomaly_direction}',
        alert_window='${var.questions_changing_anomaly_alert_window}',
        interval=${var.questions_changing_anomaly_interval},
        count_default_zero='${var.questions_changing_anomaly_count_default_zero}',
        seasonality='${var.questions_changing_anomaly_seasonality}'
      )
    > ${var.questions_changing_anomaly_threshold_critical}
EOF

  thresholds {
    warning           = "${var.questions_changing_anomaly_threshold_warning}"
    critical          = "${var.questions_changing_anomaly_threshold_critical}"
    critical_recovery = "${var.questions_changing_anomaly_threshold_critical_recovery}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.questions_changing_anomaly_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform", "engine:mysql", "${var.questions_changing_anomaly_extra_tags}"]
}
