### RDS instance CPU monitor ###
resource "datadog_monitor" "rds_cpu_90_15min" {
  count   = var.cpu_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS instance CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      avg:aws.rds.cpuutilization${module.filter-tags.query_alert} by {region,name}
    ) > ${var.cpu_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cpu_threshold_warning
    critical = var.cpu_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.cpu_extra_tags)
}

### RDS instance free space monitor ###
resource "datadog_monitor" "rds_free_space_low" {
  count   = var.diskspace_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS instance free space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.diskspace_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
    avg:aws.rds.free_storage_space${module.filter-tags.query_alert} by {region,name} /
    avg:aws.rds.total_storage_space${module.filter-tags.query_alert} by {region,name} * 100
  ) < ${var.diskspace_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.diskspace_threshold_warning
    critical = var.diskspace_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.rds_free_space_low_no_data_timeframe
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.diskspace_extra_tags)
}

### RDS Replica Lag monitor ###
resource "datadog_monitor" "rds_replica_lag" {
  count   = var.replicalag_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS replica lag {{#is_alert}}{{{comparator}}} {{threshold}} ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.replicalag_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.replicalag_time_aggregator}(${var.replicalag_timeframe}): (
    avg:aws.rds.replica_lag${module.filter-tags.query_alert} by {region,name}
  ) > ${var.replicalag_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.replicalag_threshold_warning
    critical = var.replicalag_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.replicalag_extra_tags)
}

resource "datadog_monitor" "rds_connection_variance" {
  count   = var.connection_variance_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS connection variance {{#is_alert}}{{{comparator}}} {{threshold}} ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ms ({{value}}ms){{/is_warning}}"
  message = coalesce(var.connection_variance_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.connection_variance_time_aggregator}(${var.connection_variance_timeframe}): (
    anomalies(avg:aws.rds.database_connections${module.filter-tags.query_alert} by {dbinstanceidentifier}, 'agile', 1, 
      direction='both', 
      alert_window='last_15m', 
      interval=60, 
      count_default_zero='true',
      seasonality='weekly')
  ) > ${var.connection_variance_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.connection_variance_threshold_warning
    critical = var.connection_variance_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.connection_variance_extra_tags)
}

resource "datadog_monitor" "rds_burst_balance" {
  count   = var.burst_balance_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS burst balance"
  type    = "metric alert"
  message = coalesce(var.burst_balance_message, var.message)

  query = <<EOQ
    ${var.burst_balance_time_aggregator}(${var.burst_balance_timeframe}): (
      avg:aws.rds.burst_balance${module.filter-tags.query_alert} by {region,name}
    ) <= ${var.burst_balance_threshold_critical}
EOQ

  require_full_window = false
  notify_no_data      = false

  monitor_thresholds {
    critical = var.burst_balance_threshold_critical
    warning  = var.burst_balance_threshold_warning
  }

  include_tags = false

  tags = concat(local.common_tags, var.tags, var.burst_balance_extra_tags)
}

resource "datadog_monitor" "rds_freeable_memory" {
  count   = var.rds_freeable_memory_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS freeable memory"
  type    = "metric alert"
  message = coalesce(var.rds_freeable_memory_message, var.message)

  query = <<EOQ
    ${var.rds_freeable_memory_time_aggregator}(${var.rds_freeable_memory_timeframe}): (
      avg:aws.rds.freeable_memory${module.filter-tags.query_alert} by {region,name}
    ) <= ${var.rds_freeable_memory_threshold_critical}
EOQ

  require_full_window = false
  notify_no_data      = false

  monitor_thresholds {
    critical = var.rds_freeable_memory_threshold_critical
    warning  = var.rds_freeable_memory_threshold_warning
  }

  include_tags = false

  tags = concat(local.common_tags, var.tags, var.rds_freeable_memory_extra_tags)
}

resource "datadog_monitor" "rds_read_iops" {
  count   = var.rds_read_iops_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS Read IOPS"
  type    = "metric alert"
  message = coalesce(var.rds_read_iops_message, var.message)

  query = <<EOQ
    ${var.rds_read_iops_time_aggregator}(${var.rds_read_iops_timeframe}): (
      avg:aws.rds.read_iops${module.filter-tags.query_alert} by {region,name}
    ) >= ${var.rds_read_iops_threshold_critical}
EOQ

  require_full_window = false
  notify_no_data      = false

  monitor_thresholds {
    critical = var.rds_read_iops_threshold_critical
    warning  = var.rds_read_iops_threshold_warning
  }

  include_tags = false

  tags = concat(local.common_tags, var.tags, var.rds_read_iops_extra_tags)
}

resource "datadog_monitor" "rds_write_iops" {
  count   = var.rds_write_iops_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS Write IOPS"
  type    = "metric alert"
  message = coalesce(var.rds_write_iops_message, var.message)

  query               = <<EOQ
    ${var.rds_write_iops_time_aggregator}(${var.rds_write_iops_timeframe}): (
      avg:aws.rds.write_iops${module.filter-tags.query_alert} by {region,name}
    ) >= ${var.rds_write_iops_threshold_critical}
EOQ
  require_full_window = false
  notify_no_data      = false

  monitor_thresholds {
    critical = var.rds_write_iops_threshold_critical
    warning  = var.rds_write_iops_threshold_warning
  }

  include_tags = false

  tags = concat(local.common_tags, var.tags, var.rds_write_iops_extra_tags)
}