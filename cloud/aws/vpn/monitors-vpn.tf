module "message" {
  source = "../../common/alerting-message"
  oncall_24x7 = "${var.hno_escalation_group}"
  oncall_office_hours = "${var.ho_escalation_group}"
}

resource "datadog_monitor" "VPN_status" {
  name    = "[${var.env}] VPN Down {{ tunnelipaddress }}"
  message = "${module.message.alerting-message}"

  query = <<EOF
        avg(last_5m): (
        avg:aws.vpn.tunnel_state{tunnelipaddress:${var.vpn_tunnel_address[0]}} by {region}
        + avg:aws.vpn.tunnel_state{tunnelipaddress:${var.vpn_tunnel_address[1]}} by {region}
      ) == ${var.vpn_config["critical"]}
  EOF

  type = "query alert"

  thresholds {
    ok       = "${var.vpn_config["ok"]}"
    critical = "${var.vpn_config["critical"]}"
    warning  = "${var.vpn_config["warning"]}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  evaluation_delay    = "${var.vpn_config["delay"]}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.vpn_config["delay"]}}"

  tags = ["env: ${var.env}", "provider: aws", "resource: vpn"]
}
