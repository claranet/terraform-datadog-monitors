resource "datadog_monitor" "postgresql_cpu_usage" {
  count   = var.cpu_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Postgresql Server CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_usage_time_aggregator}(${var.cpu_usage_timeframe}): (
      avg:azure.dbforpostgresql_servers.cpu_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.cpu_usage_threshold_critical}
EOQ

  thresholds = {
    critical = var.cpu_usage_threshold_critical
    warning = var.cpu_usage_threshold_warning
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = false
  renotify_interval = 0
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:postgresql", "team:claranet", "created-by:terraform"], var.cpu_usage_extra_tags)
}

resource "datadog_monitor" "postgresql_no_connection" {
  count = var.no_connection_enabled == "true" ? 1 : 0
  name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Postgresql Server has no connection"
  message = coalesce(var.no_connection_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.no_connection_time_aggregator}(${var.no_connection_timeframe}): (
      avg:azure.dbforpostgresql_servers.active_connections${module.filter-tags.query_alert} by {resource_group,region,name}
    ) < 1
EOQ

evaluation_delay    = var.evaluation_delay
new_host_delay      = var.new_host_delay
notify_no_data      = true
renotify_interval   = 0
notify_audit        = false
timeout_h           = 0
include_tags        = true
locked              = false
require_full_window = false

tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:postgresql", "team:claranet", "created-by:terraform"], var.no_connection_extra_tags)
}

resource "datadog_monitor" "postgresql_free_storage" {
count   = var.free_storage_enabled == "true" ? 1 : 0
name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Postgresql Server storage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
message = coalesce(var.free_storage_message, var.message)
type    = "query alert"

query = <<EOQ
    ${var.free_storage_time_aggregator}(${var.free_storage_timeframe}): (
      100 - avg:azure.dbforpostgresql_servers.storage_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) < ${var.free_storage_threshold_critical}
EOQ

thresholds = {
critical = var.free_storage_threshold_critical
warning = var.free_storage_threshold_warning
}

evaluation_delay = var.evaluation_delay
new_host_delay = var.new_host_delay
notify_no_data = false
renotify_interval = 0
notify_audit = false
timeout_h = 0
include_tags = true
locked = false
require_full_window = false

tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:postgresql", "team:claranet", "created-by:terraform"], var.free_storage_extra_tags)
}

resource "datadog_monitor" "postgresql_io_consumption" {
count = var.io_consumption_enabled == "true" ? 1 : 0
name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Postgresql Server IO consumption {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
message = coalesce(var.io_consumption_message, var.message)
type = "query alert"

query = <<EOQ
    ${var.io_consumption_time_aggregator}(${var.io_consumption_timeframe}): (
      avg:azure.dbforpostgresql_servers.io_consumption_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.io_consumption_threshold_critical}
EOQ

  thresholds = {
    critical = var.io_consumption_threshold_critical
    warning  = var.io_consumption_threshold_warning
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:postgresql", "team:claranet", "created-by:terraform"], var.io_consumption_extra_tags)
}

resource "datadog_monitor" "postgresql_memory_usage" {
  count   = var.memory_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Postgresql Server memory usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.memory_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.memory_usage_time_aggregator}(${var.memory_usage_timeframe}): (
      avg:azure.dbforpostgresql_servers.memory_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.memory_usage_threshold_critical}
EOQ

  thresholds = {
    critical = var.memory_usage_threshold_critical
    warning = var.memory_usage_threshold_warning
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = false
  renotify_interval = 0
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:postgresql", "team:claranet", "created-by:terraform"], var.memory_usage_extra_tags)
}

