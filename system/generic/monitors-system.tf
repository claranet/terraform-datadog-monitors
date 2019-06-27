resource "datadog_monitor" "cpu" {
  count   = var.cpu_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      100 - avg:system.cpu.idle${module.filter-tags.query_alert} by {host}
    ) > ${var.cpu_threshold_critical}
EOQ

  thresholds = {
    warning = var.cpu_threshold_warning
    critical = var.cpu_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = false
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:system", "provider:system-check", "resource:generic", "team:claranet", "created-by:terraform"], var.cpu_extra_tags)
}

resource "datadog_monitor" "load" {
  count = var.load_enabled == "true" ? 1 : 0
  name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] CPU load 5 ratio {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.load_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.load_time_aggregator}(${var.load_timeframe}): (
      avg:system.load.norm.5${module.filter-tags.query_alert} by {host}
    ) > ${var.load_threshold_critical}
EOQ

thresholds = {
warning  = var.load_threshold_warning
critical = var.load_threshold_critical
}

evaluation_delay    = var.evaluation_delay
new_host_delay      = var.new_host_delay
notify_no_data      = false
notify_audit        = false
timeout_h           = 0
include_tags        = true
locked              = false
require_full_window = true

tags = concat(["env:${var.environment}", "type:system", "provider:system-core", "resource:generic", "team:claranet", "created-by:terraform"], var.load_extra_tags)
}

resource "datadog_monitor" "disk_space" {
count   = var.disk_space_enabled == "true" ? 1 : 0
name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Disk space usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
message = coalesce(var.disk_space_message, var.message)
type = "query alert"

query = <<EOQ
    ${var.disk_space_time_aggregator}(${var.disk_space_timeframe}):
      avg:system.disk.in_use${module.filter-tags-disk.query_alert} by {host,device}
    * 100 > ${var.disk_space_threshold_critical}
EOQ

thresholds = {
warning = var.disk_space_threshold_warning
critical = var.disk_space_threshold_critical
}

evaluation_delay = var.evaluation_delay
new_host_delay = var.new_host_delay
notify_no_data = false
notify_audit = false
timeout_h = 0
include_tags = true
locked = false
require_full_window = true

tags = concat(["env:${var.environment}", "type:system", "provider:disk", "resource:generic", "team:claranet", "created-by:terraform"], var.disk_space_extra_tags)
}

resource "datadog_monitor" "disk_space_forecast" {
count = var.disk_space_forecast_enabled == "true" ? 1 : 0
name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Disk Space usage could reach {{#is_alert}}{{threshold}}%%{{/is_alert}} in a near future"
message = coalesce(var.disk_space_forecast_message, var.message)
type = "query alert"

query = <<EOQ
    ${var.disk_space_forecast_time_aggregator}(${var.disk_space_forecast_timeframe}):
      forecast(avg:system.disk.in_use${module.filter-tags-disk.query_alert} by {host,device} * 100,
              '${var.disk_space_forecast_algorithm}',
               ${var.disk_space_forecast_deviations},
               interval='${var.disk_space_forecast_interval}',
               ${var.disk_space_forecast_algorithm == "linear" ? format(
"history='%s',model='%s'",
var.disk_space_forecast_linear_history,
var.disk_space_forecast_linear_model,
) : ""}
               ${var.disk_space_forecast_algorithm == "seasonal" ? format(
"seasonality='%s'",
var.disk_space_forecast_seasonal_seasonality,
) : ""}
              )
    >= ${var.disk_space_forecast_threshold_critical}
EOQ

  thresholds = {
    critical_recovery = var.disk_space_forecast_threshold_critical_recovery
    critical          = var.disk_space_forecast_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:system", "provider:disk", "resource:generic", "team:claranet", "created-by:terraform"], var.disk_space_forecast_extra_tags)
}

resource "datadog_monitor" "disk_inodes" {
  count   = var.disk_inodes_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Disk inodes usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.disk_inodes_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.disk_inodes_time_aggregator}(${var.disk_inodes_timeframe}):
      avg:system.fs.inodes.in_use${module.filter-tags-disk.query_alert} by {host,device}
    * 100 > ${var.disk_inodes_threshold_critical}
EOQ

  thresholds = {
    warning = var.disk_inodes_threshold_warning
    critical = var.disk_inodes_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = false
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:system", "provider:disk", "resource:generic", "team:claranet", "created-by:terraform"], var.disk_inodes_extra_tags)
}

resource "datadog_monitor" "memory" {
  count = var.memory_enabled == "true" ? 1 : 0
  name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Usable Memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = var.memory_message
  type = "query alert"

  query = <<EOQ
    ${var.memory_time_aggregator}(${var.memory_timeframe}):
      avg:system.mem.usable${module.filter-tags.query_alert} by {host} /
      avg:system.mem.total${module.filter-tags.query_alert} by {host} * 100
    < ${var.memory_threshold_critical}
EOQ

thresholds = {
warning  = var.memory_threshold_warning
critical = var.memory_threshold_critical
}

evaluation_delay    = var.evaluation_delay
new_host_delay      = var.new_host_delay
notify_no_data      = false
renotify_interval   = 0
notify_audit        = false
timeout_h           = 0
include_tags        = true
locked              = false
require_full_window = true

tags = concat(["env:${var.environment}", "type:system", "provider:system-check", "resource:generic", "team:claranet", "created-by:terraform"], var.memory_extra_tags)
}

