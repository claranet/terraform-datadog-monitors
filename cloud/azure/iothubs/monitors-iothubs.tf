resource "datadog_monitor" "too_many_jobs_failed" {
  count   = var.failed_jobs_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many jobs failed {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_jobs_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_jobs_rate_time_aggregator}(${var.failed_jobs_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.jobs.failed${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.jobs.failed${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.jobs.completed${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100 , 0) > ${var.failed_jobs_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_jobs_rate_threshold_warning
    critical = var.failed_jobs_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_jobs_rate_extra_tags)
}

resource "datadog_monitor" "too_many_list_jobs_failed" {
  count   = var.failed_listjobs_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many list_jobs failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_listjobs_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_listjobs_rate_time_aggregator}(${var.failed_listjobs_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.jobs.list_jobs.failure${module.filter-tags.query_alert} by {resource_group,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.jobs.list_jobs.success${module.filter-tags.query_alert} by {resource_group,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.jobs.list_jobs.failure${module.filter-tags.query_alert} by {resource_group,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_listjobs_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_listjobs_rate_threshold_warning
    critical = var.failed_listjobs_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_listjobs_rate_extra_tags)
}

resource "datadog_monitor" "too_many_query_jobs_failed" {
  count   = var.failed_queryjobs_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many query_jobs failed {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_queryjobs_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_queryjobs_rate_time_aggregator}(${var.failed_queryjobs_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.jobs.query_jobs.failure${module.filter-tags.query_alert} by {resource_group,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.jobs.query_jobs.success${module.filter-tags.query_alert} by {resource_group,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.jobs.query_jobs.failure${module.filter-tags.query_alert} by {resource_group,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_queryjobs_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_queryjobs_rate_threshold_warning
    critical = var.failed_queryjobs_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_queryjobs_rate_extra_tags)
}

resource "datadog_monitor" "status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub is down"
  message = coalesce(var.status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.devices_iothubs.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.status_extra_tags)
}

resource "datadog_monitor" "total_devices" {
  count   = var.total_devices_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Total devices is wrong {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.total_devices_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.total_devices_time_aggregator}(${var.total_devices_timeframe}): (
      avg:azure.devices_iothubs.devices.total_devices${module.filter-tags.query_alert} by {resource_group,region,name}
    ) == 0
EOQ

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  evaluation_delay    = var.evaluation_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.total_devices_extra_tags)
}

resource "datadog_monitor" "too_many_c2d_methods_failed" {
  count   = var.failed_c2d_methods_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many c2d methods failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_c2d_methods_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_c2d_methods_rate_time_aggregator}(${var.failed_c2d_methods_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.c2d.methods.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.c2d.methods.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.c2d.methods.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_c2d_methods_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_c2d_methods_rate_threshold_warning
    critical = var.failed_c2d_methods_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_c2d_methods_rate_extra_tags)
}

resource "datadog_monitor" "too_many_c2d_twin_read_failed" {
  count   = var.failed_c2d_twin_read_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many c2d twin read failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_c2d_twin_read_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_c2d_twin_read_rate_time_aggregator}(${var.failed_c2d_twin_read_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.c2d.twin.read.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.c2d.twin.read.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.c2d.twin.read.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_c2d_twin_read_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_c2d_twin_read_rate_threshold_warning
    critical = var.failed_c2d_twin_read_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_c2d_twin_read_rate_extra_tags)
}

resource "datadog_monitor" "too_many_c2d_twin_update_failed" {
  count   = var.failed_c2d_twin_update_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many c2d twin update failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_c2d_twin_update_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_c2d_twin_update_rate_time_aggregator}(${var.failed_c2d_twin_update_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.c2d.twin.update.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.c2d.twin.update.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.c2d.twin.update.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_c2d_twin_update_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_c2d_twin_update_rate_threshold_warning
    critical = var.failed_c2d_twin_update_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_c2d_twin_update_rate_extra_tags)
}

resource "datadog_monitor" "too_many_d2c_twin_read_failed" {
  count   = var.failed_d2c_twin_read_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many d2c twin read failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_d2c_twin_read_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_d2c_twin_read_rate_time_aggregator}(${var.failed_d2c_twin_read_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.d2c.twin.read.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.twin.read.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.twin.read.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_d2c_twin_read_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_d2c_twin_read_rate_threshold_warning
    critical = var.failed_d2c_twin_read_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_d2c_twin_read_rate_extra_tags)
}

resource "datadog_monitor" "too_many_d2c_twin_update_failed" {
  count   = var.failed_d2c_twin_update_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many d2c twin update failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.failed_d2c_twin_update_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.failed_d2c_twin_update_rate_time_aggregator}(${var.failed_d2c_twin_update_rate_timeframe}):
    default(
      default(avg:azure.devices_iothubs.d2c.twin.update.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.twin.update.failure${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.twin.update.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.failed_d2c_twin_update_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.failed_d2c_twin_update_rate_threshold_warning
    critical = var.failed_d2c_twin_update_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.failed_d2c_twin_update_rate_extra_tags)
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_dropped" {
  count   = var.dropped_d2c_telemetry_egress_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many d2c telemetry egress dropped {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.dropped_d2c_telemetry_egress_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.dropped_d2c_telemetry_egress_time_aggregator}(${var.dropped_d2c_telemetry_egress_timeframe}):
    default(
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.dropped_d2c_telemetry_egress_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.dropped_d2c_telemetry_egress_rate_threshold_warning
    critical = var.dropped_d2c_telemetry_egress_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.dropped_d2c_telemetry_egress_extra_tags)
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_orphaned" {
  count   = var.orphaned_d2c_telemetry_egress_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many d2c telemetry egress orphaned {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.orphaned_d2c_telemetry_egress_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.orphaned_d2c_telemetry_egress_time_aggregator}(${var.orphaned_d2c_telemetry_egress_timeframe}):
    default(
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.orphaned_d2c_telemetry_egress_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.orphaned_d2c_telemetry_egress_rate_threshold_warning
    critical = var.orphaned_d2c_telemetry_egress_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.orphaned_d2c_telemetry_egress_extra_tags)
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_invalid" {
  count   = var.invalid_d2c_telemetry_egress_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many d2c telemetry egress invalid {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.invalid_d2c_telemetry_egress_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.invalid_d2c_telemetry_egress_time_aggregator}(${var.invalid_d2c_telemetry_egress_timeframe}):
    default(
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100, 0) > ${var.invalid_d2c_telemetry_egress_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.invalid_d2c_telemetry_egress_rate_threshold_warning
    critical = var.invalid_d2c_telemetry_egress_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.invalid_d2c_telemetry_egress_extra_tags)
}

resource "datadog_monitor" "too_many_d2c_telemetry_ingress_nosent" {
  count   = var.too_many_d2c_telemetry_ingress_nosent_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] IOT Hub Too many d2c telemetry ingress not sent {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.too_many_d2c_telemetry_ingress_nosent_message, var.message)
  type    = "query alert"

  #For this monitor, the avg is needed to smooth the -1 and +1 that we meet regularly. With just a tiny diff like -1 / + 1, if we put 0.3 it should not ring anymore. But there is a bigger difference (exemple 20) The average will be strongly raised and an alert will be triggered.
  query = <<EOQ
    avg(${var.too_many_d2c_telemetry_ingress_nosent_timeframe}):
      100-(default(avg:zure.devices_iothubs.d2c.telemetry.ingress.success${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate() /
      avg:azure.devices_iothubs.d2c.telemetry.ingress.all_protocol${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(),1)
      * 100) > ${var.too_many_d2c_telemetry_ingress_nosent_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.too_many_d2c_telemetry_ingress_nosent_rate_threshold_warning
    critical = var.too_many_d2c_telemetry_ingress_nosent_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform"], var.too_many_d2c_telemetry_ingress_nosent_extra_tags)
}
