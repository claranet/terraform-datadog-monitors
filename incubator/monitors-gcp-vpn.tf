resource "datadog_monitor" "gcp_vpn" {
  name    = "GCP VPN is down"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"

  query = "avg(last_5m):avg:gcp.vpn.tunnel_established{*} <= 0"

  thresholds = {
    critical = 0
  }

  type                = "metric alert"
  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

