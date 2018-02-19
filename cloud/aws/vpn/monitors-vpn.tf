resource "datadog_monitor" "VPN_status" {
  name    = "[${var.environment}] VPN Down {{ tunnelipaddress }}"
  message = "${var.message}"

  query = <<EOF
        avg(last_5m): (
        avg:aws.vpn.tunnel_state{tunnelipaddress:${var.vpn_tunnel_address[0]}} by {region,name}
        + avg:aws.vpn.tunnel_state{tunnelipaddress:${var.vpn_tunnel_address[1]}} by {region,name}
      ) == ${var.vpn_status_critical}
  EOF

  type = "metric alert"

  thresholds {
    ok       = "${var.vpn_status_ok}"
    warning  = "${var.vpn_status_warning}"
    critical = "${var.vpn_status_critical}"
  }

  notify_no_data      = true
  renotify_interval   = 0
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false

  tags = ["env: ${var.environment}", "resource:vpn", "team:aws", "provider:aws"]
}
