data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_mongodb:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "mongodb_primary" {
  name    = "[${var.environment}] MongoDB primary state"
  message = "${coalesce(var.mongodb_primary_message, var.message)}"

  query = <<EOF
      ${var.mongodb_primary_aggregator}(${var.mongodb_primary_timeframe}):
      min:mongodb.replset.state{${data.template_file.filter.rendered}} by {replset_name} >= 2
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
  name    = "[${var.environment}] MongoDB secondary state"
  message = "${coalesce(var.mongodb_secondary_message, var.message)}"

  query = <<EOF
      ${var.mongodb_secondary_aggregator}(${var.mongodb_secondary_timeframe}):
      max:mongodb.replset.state{${data.template_file.filter.rendered},replset_state:secondary} by {server} >= 6
  EOF

  thresholds {
    critical = 6
    warning  = 3
  }

  type = "metric alert"

  notify_no_data      = true
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
      avg:mongodb.replset.replicationlag{${data.template_file.filter.rendered},replset_state:secondary} by {server} > ${var.mongodb_lag_critical}
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
