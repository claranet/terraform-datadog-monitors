data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_postgres:enabled,db_env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "postgresql_connection_too_high" {
  count   = "${var.postgresql_connection_enabled ? 1 : 0}"
  name    = "[${var.environment}] PostgreSQL Connections {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.postgresql_connection_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    avg(last_15m): (
      avg:postgresql.percent_usage_connections{${data.template_file.filter.rendered}} by {db_host}
    ) * 100 > ${var.postgresql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.postgresql_connection_threshold_warning}"
    critical = "${var.postgresql_connection_threshold_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.postgresql_connection_silenced}"

  tags = ["env:${var.environment}", "resource:postgresql"]
}

resource "datadog_monitor" "postgresql_too_many_locks" {
  count   = "${var.postgresql_lock_enabled ? 1 : 0}"
  name    = "[${var.environment}] PostgreSQL too many locks {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.postgresql_lock_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    avg(last_5m): (
      avg:postgresql.locks{${data.template_file.filter.rendered}} by {db_host}
    ) > ${var.postgresql_lock_threshold_critical}
  EOF

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  thresholds {
    warning  = "${var.postgresql_lock_threshold_warning}"
    critical = "${var.postgresql_lock_threshold_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.posgresql_lock_silenced}"

  tags = ["env:${var.environment}", "resource:postgresql"]
}
