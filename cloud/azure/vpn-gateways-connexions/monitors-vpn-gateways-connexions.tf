# Monitoring VPN Gateway Connexion status
resource "datadog_monitor" "vpngw_connexion_status" {
  count   = var.vpngw_connexion_status_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] VPN Gateway Connexion status {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.vpngw_connexion_status_status_message, var.message)
  type    = "service check"

  query = <<EOQ
    "virtual_network_gateway.connected"${module.filter-tags.service_check}.by("conn_name", "host").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.vpngw_connexion_status_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.vpngw_connexion_status_no_data_timeframe
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:vpn-gateway-connexion",
  "team:claranet", "created-by:terraform"], var.vpngw_connexion_status_extra_tags)
}
