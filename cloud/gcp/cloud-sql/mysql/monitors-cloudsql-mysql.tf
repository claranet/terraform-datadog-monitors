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
