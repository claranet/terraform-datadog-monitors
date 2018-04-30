data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_monitoring_mongodb:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "mongodb_replicaset_state" {
  name    = "[${var.environment}] Member down in the replica set"
  message = "${coalesce(var.mongodb_replicaset_message, var.message)}"

  query = <<EOF
      ${var.mongodb_replicaset_aggregator}(${var.mongodb_replicaset_timeframe}): (
        ${var.mongodb_replicaset_aggregator}:mongodb.replset.health{${data.template_file.filter.rendered}} by {region,replset_name}
      ) < 1
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

  silenced = "${var.mongodb_replicaset_silenced}"

  tags = ["env:${var.environment}", "resource:mongodb"]
}
