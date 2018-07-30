#
# FILTERS
#
data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
             format("project_id:%s",var.project_id) :
             "${var.filter_tags_custom}"}"
  }
}

#
# MySQL Network Connections
#
resource "datadog_monitor" "network_connections" {
  count = "${var.network_connections_enabled} == true ? 1 : 0 "

  name    = "[${var.environment}] Cloud SQL MySQL Network Connections (hard limit: ${var.network_connections_hard_limit}) {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_connections_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.network_connections_timeframe}):
    avg:gcp.cloudsql.database.network.connections{${data.template_file.filter.rendered}}
    by {database_id}
    > ${var.network_connections_threshold_critical}
EOF

  thresholds {
    warning  = "${var.network_connections_threshold_warning}"
    critical = "${var.network_connections_threshold_critical}"
  }

  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.network_connections_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "engine:mysql",
    "${var.network_connections_extra_tags}",
  ]
}

#
# Replication Lag
#
resource "datadog_monitor" "replication_lag" {
  count = "${var.replication_lag_enabled} == true ? 1 : 0 "

  name    = "[${var.environment}] Cloud SQL MySQL Replication Lag {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.replication_lag_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  min(${var.replication_lag_timeframe}):
    avg:gcp.cloudsql.database.mysql.replication.seconds_behind_master{${data.template_file.filter.rendered}}
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
  no_data_timeframe   = 25
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.replication_lag_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "engine:mysql",
    "${var.replication_lag_extra_tags}",
  ]
}

#
# Queries Anomaly
#
resource "datadog_monitor" "queries_changing_anomaly" {
  count = "${var.queries_changing_enabled} == true ? 1 : 0 "

  name    = "[${var.environment}] Cloud SQL MySQL Queries Count changed abnormally"
  message = "${coalesce(var.queries_changing_message, var.message)}"

  type = "query alert"

  query = <<EOF
    avg(${var.queries_changing_timeframe}):
      anomalies(
        avg:gcp.cloudsql.database.mysql.queries{${data.template_file.filter.rendered}} by {database_id}.as_count()
        '${var.queries_changing_anomaly_detection_algorithm}',
        ${var.queries_changing_deviations},
        direction='${var.queries_changing_direction}',
        alert_window='last_30m',
        interval=20,
        count_default_zero='false',
        seasonality='${var.queries_changing_seasonality}'
      )
      > ${var.queries_changing_threshold_critical}
EOF

  thresholds {
    warning           = "${var.queries_changing_threshold_warning}"
    critical          = "${var.queries_changing_threshold_critical}"
    critical_recovery = "${var.queries_changing_threshold_critical_recovery}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.queries_changing_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "engine:mysql",
    "${var.queries_changing_extra_tags}",
  ]
}

#
# Questions Anomaly
#
resource "datadog_monitor" "questions_changing_anomaly" {
  count = "${var.questions_changing_enabled} == true ? 1 : 0 "

  name    = "[${var.environment}] Cloud SQL MySQL Questions Count changed abnormally"
  message = "${coalesce(var.questions_changing_message, var.message)}"

  type = "query alert"

  query = <<EOF
    avg(last_1h):
      anomalies(
        avg:gcp.cloudsql.database.mysql.questions{${data.template_file.filter.rendered}} by {database_id},
        '${var.questions_changing_anomaly_detection_algorithm}',
        ${var.questions_changing_deviations},
        direction='${var.questions_changing_direction}',
        alert_window='last_30m',
        interval=20,
        count_default_zero='false',
        seasonality='${var.questions_changing_seasonality}'
      )
    > ${var.questions_changing_threshold_critical}
EOF

  thresholds {
    warning           = "${var.questions_changing_threshold_warning}"
    critical          = "${var.questions_changing_threshold_critical}"
    critical_recovery = "${var.questions_changing_threshold_critical_recovery}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.questions_changing_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "engine:mysql",
    "${var.questions_changing_extra_tags}",
  ]
}
