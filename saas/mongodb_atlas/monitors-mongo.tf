#
# Primary state
#
resource "datadog_monitor" "mongodb_primary" {
  count   = var.mongodb_primary_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB primary state"
  message = coalesce(var.mongodb_primary_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.mongodb_primary_aggregator}(${var.mongodb_primary_timeframe}):
      min:mongodb.atlas.replstatus.state${module.filter-tags.query_alert} by {clustername,replicasetname} >= 2
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.mongodb_primary_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_primary_extra_tags)
}

#
# Secondary missing
#
resource "datadog_monitor" "mongodb_secondary" {
  count   = var.mongodb_secondary_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB secondary missing"
  message = coalesce(var.mongodb_secondary_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_secondary_aggregator}(${var.mongodb_secondary_timeframe}):
      ${var.mongodb_desired_servers_count} -
      sum:mongodb.atlas.replstatus.health${module.filter-tags.query_alert} by {clustername,replicasetname}
      > 1
EOQ

  monitor_thresholds {
    critical = 1
    warning  = 0
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_secondary_extra_tags)
}

#
# Replication lag
#
resource "datadog_monitor" "mongodb_replication" {
  count   = var.mongodb_replication_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB replication lag"
  message = coalesce(var.mongodb_replication_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.mongodb_replication_aggregator}(${var.mongodb_replication_timeframe}):
      avg:mongodb.atlas.replset.replicationlag${module.filter-tags.query_alert} by {clustername} > ${var.mongodb_lag_critical}
EOQ

  monitor_thresholds {
    critical = var.mongodb_lag_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_replication_extra_tags)
}

resource "datadog_monitor" "mongodb_replication_warning" {
  count   = var.mongodb_replication_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB replication lag"
  message = coalesce(var.mongodb_replication_message, var.message_warning)
  type    = "metric alert"

  query = <<EOQ
      ${var.mongodb_replication_aggregator}(${var.mongodb_replication_timeframe}):
      avg:mongodb.atlas.replset.replicationlag${module.filter-tags.query_alert} by {clustername} > ${var.mongodb_lag_warning}
EOQ

  monitor_thresholds {
    critical = var.mongodb_lag_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_replication_extra_tags)
}

#
# High file system storage usage
#
resource "datadog_monitor" "mongodb_high_disk_usage" {
  count   = var.mongodb_high_disk_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB High file system storage usage"
  message = coalesce(var.mongodb_high_disk_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_high_disk_usage_aggregator}(${var.mongodb_high_disk_usage_timeframe}):
        mongodb.atlas.system.disk.max.space.percentused${module.filter-tags.query_alert} by {clustername, host}
        > ${var.mongodb_high_disk_usage_critical}
EOQ

  monitor_thresholds {
    critical = var.mongodb_high_disk_usage_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_high_disk_usage_extra_tags)
}

resource "datadog_monitor" "mongodb_high_disk_usage_warning" {
  count   = var.mongodb_high_disk_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB High file system storage usage"
  message = coalesce(var.mongodb_high_disk_usage_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_high_disk_usage_aggregator}(${var.mongodb_high_disk_usage_timeframe}):
        mongodb.atlas.system.disk.max.space.percentused${module.filter-tags.query_alert} by {clustername, host}
        > ${var.mongodb_high_disk_usage_warning}
EOQ

  monitor_thresholds {
    critical = var.mongodb_high_disk_usage_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_high_disk_usage_extra_tags)
}

#
# Low oplog window
#
resource "datadog_monitor" "mongodb_oplog_low" {
  count   = var.mongodb_oplog_low_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Low oplog window"
  message = coalesce(var.mongodb_oplog_low_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_oplog_low_aggregator}(${var.mongodb_oplog_low_timeframe}):
        100
        * avg:mongodb.atlas.replset.oplogWindow${module.filter-tags.query_alert} by {clustername,host} < ${var.mongodb_oplog_low_critical}
EOQ

  monitor_thresholds {
    critical = var.mongodb_oplog_low_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_oplog_low_extra_tags)
}

resource "datadog_monitor" "mongodb_oplog_low_warning" {
  count   = var.mongodb_oplog_low_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Low oplog window"
  message = coalesce(var.mongodb_oplog_low_message, var.message_warning)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_oplog_low_aggregator}(${var.mongodb_oplog_low_timeframe}):
        100
        * avg:mongodb.atlas.replset.oplogWindow${module.filter-tags.query_alert} by {clustername,host} < ${var.mongodb_oplog_low_warning}
EOQ

  monitor_thresholds {
    critical = var.mongodb_oplog_low_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_oplog_low_extra_tags)
}

#
# Unhealthy replica set
#
resource "datadog_monitor" "mongodb_replicaset_member_unhealthy" {
  count   = var.mongodb_replicaset_member_unhealthy_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Unhealthy replica set member"
  message = coalesce(var.mongodb_replicaset_member_unhealthy_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_replicaset_member_unhealthy_aggregator}(${var.mongodb_replicaset_member_unhealthy_timeframe}):
        avg:mongodb.atlas.replstatus.health${module.filter-tags.query_alert} by {clustername,host}
        != ${var.mongodb_replicaset_member_unhealthy_critical}
EOQ

  monitor_thresholds {
    critical = var.mongodb_replicaset_member_unhealthy_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_replicaset_member_unhealthy_extra_tags)
}

#
# CPU usage
#
resource "datadog_monitor" "mongodb_cpu_high" {
  count   = var.mongodb_cpu_high_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB CPU usage is higher than average on host: {{host.name}}"
  message = coalesce(var.mongodb_cpu_high_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_cpu_high_aggregator}(${var.mongodb_cpu_high_timeframe}):
        anomalies(avg:mongodb.atlas.system.cpu.norm.irq${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.nice${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.user${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.guest${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.steal${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.iowait${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.kernel${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.system.cpu.norm.softirq${module.filter-tags.query_alert} by {clustername,host}
        , 'agile', 2, direction='above', interval=60, alert_window='${var.mongodb_cpu_high_alert_window}', count_default_zero='true', seasonality='hourly')
        >= ${var.mongodb_cpu_high_critical}
EOQ

  monitor_threshold_windows {
    recovery_window = var.mongodb_cpu_high_recovery_window
    trigger_window  = var.mongodb_cpu_high_trigger_window
  }

  monitor_thresholds {
    critical          = var.mongodb_cpu_high_critical
    critical_recovery = var.mongodb_cpu_high_critical_recovery
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.mongodb_cpu_high_extra_tags)
}

#
# Query efficiency
#
resource "datadog_monitor" "mongodb_query_efficiency" {
  count   = var.mongodb_query_efficiency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Efficiency of queries is degrading"
  message = coalesce(var.mongodb_query_efficiency_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_query_efficiency_aggregator}(${var.mongodb_query_efficiency_timeframe}):
        anomalies(avg:mongodb.atlas.metrics.queryexecutor.scannedobjectsperreturned${module.filter-tags.query_alert} by {clustername}
        , 'agile', 2, direction='above', interval=60, alert_window='${var.mongodb_query_efficiency_alert_window}', count_default_zero='true', seasonality='hourly')
        >= ${var.mongodb_query_efficiency_critical}
EOQ

  monitor_threshold_windows {
    recovery_window = var.mongodb_query_efficiency_recovery_window
    trigger_window  = var.mongodb_query_efficiency_trigger_window
  }

  monitor_thresholds {
    critical          = var.mongodb_query_efficiency_critical
    critical_recovery = var.mongodb_query_efficiency_critical_recovery
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_query_efficiency_extra_tags)
}

#
# Memory usage
#
resource "datadog_monitor" "mongodb_mem_usage" {
  count   = var.mongodb_mem_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Memory usage is higher than average on host: {{host.name}}"
  message = coalesce(var.mongodb_mem_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_mem_usage_aggregator}(${var.mongodb_mem_usage_timeframe}):
        anomalies(avg:mongodb.atlas.mem.virtual${module.filter-tags.query_alert} by {clustername,host}
        + avg:mongodb.atlas.mem.resident${module.filter-tags.query_alert} by {clustername,host}
        , 'agile', 2, direction='above', interval=60, alert_window='${var.mongodb_mem_usage_alert_window}', count_default_zero='true', seasonality='hourly')
        >= ${var.mongodb_mem_usage_critical}
EOQ

  monitor_threshold_windows {
    recovery_window = var.mongodb_mem_usage_recovery_window
    trigger_window  = var.mongodb_mem_usage_trigger_window
  }

  monitor_thresholds {
    critical          = var.mongodb_mem_usage_critical
    critical_recovery = var.mongodb_mem_usage_critical_recovery
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.mongodb_mem_usage_extra_tags)
}

#
# Read latency
#
resource "datadog_monitor" "mongodb_read_latency" {
  count   = var.mongodb_read_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Read Latency is too high on host: {{host.name}}"
  message = coalesce(var.mongodb_read_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_read_latency_aggregator}(${var.mongodb_read_latency_timeframe}):
        avg:mongodb.atlas.oplatencies.reads.avg${module.filter-tags.query_alert} by {clustername,host}
        >= ${var.mongodb_read_latency_critical}
EOQ

  monitor_thresholds {
    critical          = var.mongodb_read_latency_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.mongodb_read_latency_extra_tags)
}

#
# Write latency
#
resource "datadog_monitor" "mongodb_write_latency" {
  count   = var.mongodb_write_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] [{{clustername.name}}] MongoDB Write Latency is too high for host: {{host.name}}"
  message = coalesce(var.mongodb_write_latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_write_latency_aggregator}(${var.mongodb_write_latency_timeframe}):
        avg:mongodb.atlas.oplatencies.writes.avg${module.filter-tags.query_alert} by {clustername,host}
        >= ${var.mongodb_write_latency_critical}
EOQ

  monitor_thresholds {
    critical          = var.mongodb_write_latency_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.mongodb_write_latency_extra_tags)
}
