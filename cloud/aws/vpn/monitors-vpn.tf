data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_vpn:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "VPN_status" {
  name    = "[${var.environment}] VPN Down"
  message = "${coalesce(var.vpn_status_message, var.message)}"

  query = <<EOF
        avg(last_5m): (
          avg:aws.vpn.tunnel_state{${data.template_file.filter.rendered}} by {region,name}
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
  require_full_window = false

  silenced = "${var.vpn_status_silenced}"

  tags = ["env: ${var.environment}", "resource:vpn", "team:aws", "provider:aws"]
}
