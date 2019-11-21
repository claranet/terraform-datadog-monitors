resource "datadog_monitor" "postgresql_availability" {
  count   = var.postgresql_availability_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PostgreSQL server does not respond"
  message = coalesce(var.postgresql_availability_message, var.message)
  type    = "service check"

  query = <<EOQ
    "postgres.can_connect"${module.filter-tags.service_check}.by("port","server").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.postgresql_availability_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.postgresql_availability_no_data_timeframe
  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:postgres", "resource:postgresql", "team:claranet", "created-by:terraform"], var.postgresql_availability_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "postgresql_connection_too_high" {
  count   = var.postgresql_connection_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PostgreSQL Connections {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.postgresql_connection_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.postgresql_connection_time_aggregator}(${var.postgresql_connection_timeframe}):
      avg:postgresql.percent_usage_connections${module.filter-tags.query_alert} by {server}
    * 100 > ${var.postgresql_connection_threshold_critical}
EOQ

  thresholds = {
    warning  = var.postgresql_connection_threshold_warning
    critical = var.postgresql_connection_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:postgres", "resource:postgresql", "team:claranet", "created-by:terraform"], var.postgresql_connection_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "postgresql_too_many_locks" {
  count   = var.postgresql_lock_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PostgreSQL too many locks {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.postgresql_lock_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.postgresql_lock_time_aggregator}(${var.postgresql_lock_timeframe}):
      default(avg:postgresql.locks${module.filter-tags.query_alert} by {server}, 0)
    > ${var.postgresql_lock_threshold_critical}
EOQ

  thresholds = {
    warning  = var.postgresql_lock_threshold_warning
    critical = var.postgresql_lock_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:postgres", "resource:postgresql", "team:claranet", "created-by:terraform"], var.postgresql_lock_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

