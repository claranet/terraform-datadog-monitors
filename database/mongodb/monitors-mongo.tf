resource "datadog_monitor" "mongodb_primary" {
  count   = var.mongodb_primary_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] MongoDB primary state"
  message = coalesce(var.mongodb_primary_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.mongodb_primary_aggregator}(${var.mongodb_primary_timeframe}):
      min:mongodb.replset.state${module.filter-tags.query_alert} by {replset_name} >= 2
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

resource "datadog_monitor" "mongodb_secondary" {
  count   = var.mongodb_secondary_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] MongoDB secondary missing"
  message = coalesce(var.mongodb_secondary_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.mongodb_secondary_aggregator}(${var.mongodb_secondary_timeframe}):
      ${var.mongodb_desired_servers_count} -
      sum:mongodb.replset.health${module.filter-tags.query_alert} by {replset_name}
      > 1
EOQ

  monitor_thresholds {
    critical = 1
    warning  = 0
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_secondary_extra_tags)
}

resource "datadog_monitor" "mongodb_server_count" {
  count   = var.mongodb_server_count_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] MongoDB too much servers or wrong monitoring config"
  message = coalesce(var.mongodb_server_count_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.mongodb_server_count_aggregator}(${var.mongodb_server_count_timeframe}):
      sum:mongodb.replset.health${module.filter-tags.query_alert} by {replset_name}
      > 99
EOQ

  monitor_thresholds {
    critical = 99
    warning  = var.mongodb_desired_servers_count
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_secondary_extra_tags)
}

resource "datadog_monitor" "mongodb_replication" {
  count   = var.mongodb_replication_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] MongoDB replication lag"
  message = coalesce(var.mongodb_replication_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.mongodb_replication_aggregator}(${var.mongodb_replication_timeframe}):
      avg:mongodb.replset.replicationlag${module.filter-tags-secondary.query_alert} by {server} > ${var.mongodb_lag_critical}
EOQ

  monitor_thresholds {
    critical = var.mongodb_lag_critical
    warning  = var.mongodb_lag_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mongodb_replication_extra_tags)
}

