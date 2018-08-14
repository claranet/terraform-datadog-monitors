resource "datadog_monitor" "mongodb_primary" {
  name    = "[${var.environment}] MongoDB primary state"
  message = "${coalesce(var.mongodb_primary_message, var.message)}"

  query = <<EOF
      ${var.mongodb_primary_aggregator}(${var.mongodb_primary_timeframe}):
      min:mongodb.replset.state${module.filter-tags.query_alert} by {replset_name} >= 2
  EOF

  type = "metric alert"

  notify_no_data      = true
  renotify_interval   = 0
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  silenced = "${var.mongodb_primary_silenced}"

  tags = ["env:${var.environment}", "resource:mongodb"]
}

resource "datadog_monitor" "mongodb_secondary" {
  name    = "[${var.environment}] MongoDB secondary missing"
  message = "${coalesce(var.mongodb_secondary_message, var.message)}"

  query = <<EOF
      ${var.mongodb_secondary_aggregator}(${var.mongodb_secondary_timeframe}):
      ${var.mongodb_desired_servers_count} -
      sum:mongodb.replset.health${module.filter-tags.query_alert} by {replset_name}
      > 1
  EOF

  thresholds {
    critical = 1
    warning  = 0
  }

  type = "metric alert"

  notify_no_data      = false
  renotify_interval   = 0
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  silenced = "${var.mongodb_secondary_silenced}"

  tags = ["env:${var.environment}", "resource:mongodb"]
}

resource "datadog_monitor" "mongodb_server_count" {
  name    = "[${var.environment}] MongoDB too much servers or wrong monitoring config"
  message = "${coalesce(var.mongodb_server_count_message, var.message)}"

  query = <<EOF
      ${var.mongodb_server_count_aggregator}(${var.mongodb_server_count_timeframe}):
      sum:mongodb.replset.health${module.filter-tags.query_alert} by {replset_name}
      > 99
  EOF

  thresholds {
    critical = 99
    warning  = "${var.mongodb_desired_servers_count}"
  }

  type = "metric alert"

  notify_no_data      = false
  renotify_interval   = 0
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  silenced = "${var.mongodb_secondary_silenced}"

  tags = ["env:${var.environment}", "resource:mongodb"]
}

resource "datadog_monitor" "mongodb_replication" {
  name    = "[${var.environment}] MongoDB replication lag"
  message = "${coalesce(var.mongodb_replication_message, var.message)}"

  query = <<EOF
      ${var.mongodb_replication_aggregator}(${var.mongodb_replication_timeframe}):
      avg:mongodb.replset.replicationlag${module.filter-tags-secondary.query_alert} by {server} > ${var.mongodb_lag_critical}
  EOF

  thresholds {
    critical = "${var.mongodb_lag_critical}"
    warning  = "${var.mongodb_lag_warning}"
  }

  type = "metric alert"

  notify_no_data      = false
  renotify_interval   = 0
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true

  silenced = "${var.mongodb_replication_silenced}"

  tags = ["env:${var.environment}", "resource:mongodb"]
}
