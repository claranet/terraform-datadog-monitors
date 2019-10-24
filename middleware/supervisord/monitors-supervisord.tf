resource "datadog_monitor" "datadog_supervisord_process" {
  count   = var.supervisord_connect_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] supervisord vhost status does not respond"
  message = coalesce(var.supervisord_connect_message, var.message)
  type    = "service check"

  query = <<EOQ
    "supervisord.can_connect"${module.filter-tags.service_check}.by("port","server").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.supervisord_connect_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:middleware", "provider:supervisord", "resource:supervisord", "team:claranet", "created-by:terraform"], var.supervisord_connect_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

