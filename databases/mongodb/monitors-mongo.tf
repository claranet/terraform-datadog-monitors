module "message" {
  source              = "../../common/alerting-message"
  oncall_24x7         = "${var.hno_escalation_group}"
  oncall_office_hours = "${var.ho_escalation_group}"
}

resource "datadog_monitor" "Mongodb_ReplicaSet_State" {
  name    = "[${var.env}] Replica Set heath for {{ replset_name }}"
  message = "${module.message.alerting-message}"

  query = <<EOF
      avg(last_5m): (
        avg:mongodb.replset.health{dd_monitoring:enabled,dd_monitoring_mongodb,env:${var.env}} by {replset_name}
      ) == ${var.mongo_config["critical"]}
  EOF

  type = "query alert"

  thresholds {
    ok       = "${var.mongo_config["ok"]}"
    critical = "${var.mongo_config["critical"]}"
  }

  notify_no_data      = true
  renotify_interval   = 15
  evaluation_delay    = "${var.mongo_config["delay"]}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = ["env:${var.env}", "type:mongodb"]
}
