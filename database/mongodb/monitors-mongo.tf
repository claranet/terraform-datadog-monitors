resource "datadog_monitor" "mongodb_primary" {
  count   = var.mongodb_primary_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] MongoDB primary state"
  message = coalesce(var.mongodb_primary_message, var.message)
  type    = "metric alert"

  query               = <<EOQ
      ${var.mongodb_primary_aggregator}(${var.mongodb_primary_timeframe}):
      min:mongodb.replset.state${module.filter-tags.query_alert} by {replset_name} >= 2
EOQ
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:mongo", "resource:mongodb", "team:claranet", "created-by:terraform"], var.mongodb_primary_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
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

  thresholds = {
    critical = 1
    warning  = 0
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:mongo", "resource:mongodb", "team:claranet", "created-by:terraform"], var.mongodb_secondary_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
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

  thresholds = {
    critical = 99
    warning  = var.mongodb_desired_servers_count
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:mongo", "resource:mongodb", "team:claranet", "created-by:terraform"], var.mongodb_secondary_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
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

  thresholds = {
    critical = var.mongodb_lag_critical
    warning  = var.mongodb_lag_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:mongo", "resource:mongodb", "team:claranet", "created-by:terraform"], var.mongodb_replication_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

