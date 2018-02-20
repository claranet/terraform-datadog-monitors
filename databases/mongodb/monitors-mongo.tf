data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_monitoring_mongodb:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "mongodb_replicaset_state" {
  name    = "[${var.environment}] Replica Set heath for {{ replset_name }}"
  message = "${var.message}"

  query = <<EOF
      avg(last_5m): (
        avg:mongodb.replset.health{${data.template_file.filter.rendered}} by {region,replset_name}
      ) == 0
  EOF

  type = "metric alert"

  notify_no_data      = true
  renotify_interval   = 0
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false

  tags = ["env:${var.environment}", "resource:mongodb", "team:aws", "provider:aws"]
}
