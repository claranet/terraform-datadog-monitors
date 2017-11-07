data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_sqldb:enabled,env:%s",var.environment) : "*"}"
  }
}

resource "datadog_monitor" "sql-database_cpu_90_15min" {
  name    = "[${var.environment}] SQL Database CPU high > 90% for 15 min on {{name}}"
  message = "${message}"

  query = <<EOF
    avg(last_15m): (
      avg:azure.sql_servers_databases.cpu_percent{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.cpu_threshold_critical}
  EOF

  type = "query alert"

  thresholds {
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "sql-database_free_space_low" {
  name    = "[${var.environment}] SQL Database free space < 10 % on {{name}}"
  message = "${message}"

  type = "query alert"

  query = <<EOF
    avg(last_15m): (
      avg:azure.sql_servers_databases.storage_percent{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.diskspace_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "sql-database_dtu_consumption_high" {
  name    = "[${var.environment}] DTU Consumption on {{name}} > 90"
  message = "${message}"

  type = "query alert"

  query = <<EOF
    avg(last_15m): (
      azure.sql_servers_databases.dtu_consumption_percent{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.dtu_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.dtu_threshold_warning}"
    critical = "${var.dtu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "sql-database_deadlocks_count" {
  name    = "[${var.environment}] SQL Deadlocks too high on {{name}}"
  message = "${message}"

  type = "query alert"

  query = <<EOF
    sum(last_5m): (
      avg:azure.sql_servers_databases.deadlock{${data.template_file.filter.rendered}} by {name,resource_group}.as_count()
    ) > ${var.deadlock_threshold_critical}
  EOF

  thresholds {
    critical = "${var.deadlock_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}
