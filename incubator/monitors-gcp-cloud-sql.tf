resource "datadog_monitor" "cloud_sql_cpu_90" {
  name    = "Cloud SQL CPU high > 90%"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "avg(last_5m):avg:gcp.cloudsql.database.cpu.utilization{project_id:${var.project_id}} >= 90"
  type    = "query alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "cloud_sql_disk_space" {
  name    = "Cloud SQL free disk space < 10%"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  query   = "avg(last_5m):avg:gcp.cloudsql.database.disk.bytes_used{project_id:${var.project_id}} by {database_id} / avg:gcp.cloudsql.database.disk.quota{project_id:${var.project_id}} by {database_id} * 100  >= 90"

  thresholds {
    warning  = 70
    critical = 90
  }

  type                = "query alert"
  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "cloud_sql_connection_80" {
  name    = "Cloud SQL MySQL connection > 80% of max connections"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "avg(last_5m):avg:gcp.cloudsql.database.network.connections{*} > 3500"
  type    = "metric alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "cloud_sql_lag" {
  name    = "Cloud SQL MySQL lag > 45min"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "min(last_10m):avg:gcp.cloudsql.database.mysql.replication.seconds_behind_master{*} by {database_id} > 2700"
  type    = "metric alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "cloud_sql_replication" {
  name    = "Cloud SQL Failover not ready to replication"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "max(last_5m):avg:gcp.cloudsql.database.mysql.replication.available_for_failover{*} <= 0"
  type    = "metric alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}
