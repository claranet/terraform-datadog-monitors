resource "datadog_monitor" "VPN_status" {
  count   = var.vpn_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] VPN tunnel down"
  message = coalesce(var.vpn_status_message, var.message)
  type    = "query alert"

  query = <<EOQ
        ${var.vpn_status_time_aggregator}(${var.vpn_status_timeframe}): (
          min:aws.vpn.tunnel_state{${var.filter_tags}} by {region,tunnelipaddress}
        ) < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:vpn", "team:claranet", "created-by:terraform"], var.vpn_status_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

