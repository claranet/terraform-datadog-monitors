resource "datadog_monitor" "ELB_no_healthy_instances" {
  name    = "[${var.env}] ELB no healthy instances on {{host.identifier}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  count = "${var.dd_aws_elb == "enabled" ? 1 : 0 }"
  query = "avg(last_5m):avg:aws.elb.healthy_host_count{dd_monitoring:enabled,dd_aws_elb:enabled,env:${var.env}} by {identifier,region} == 0"
  type  = "query alert"

  notify_no_data      = "${var.elb_config["notify_no_data"]}"
  evaluation_delay    = "${var.elb_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.elb_config["delay"]}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "ELB_unhealthy_instances" {
  name    = "[${var.env}] ELB some unhealthy instances on {{host.identifier}}"
  message = "{{#is_alert}}\n${var.ho_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.ho_escalation_group}\n{{/is_recovery}}"

  count = "${var.dd_aws_elb == "enabled" ? 1 : 0 }"
  query = "avg(last_5m):avg:aws.elb.healthy_host_count{dd_monitoring:enabled,dd_aws_elb:enabled,env:${var.env}} by {identifier,region} == 0"
  type  = "query alert"

  notify_no_data      = "${var.elb_config["notify_no_data"]}"
  evaluation_delay    = "${var.elb_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.elb_config["delay"]}"
  no_data_timeframe   = 20
}


