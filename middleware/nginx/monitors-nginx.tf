resource "datadog_monitor" "datadog_nginx_process" {
  name    = "[${var.environment}] Nginx vhost status does not respond"
  message = "${coalesce(var.nginx_connect_message, var.message)}"

  type = "service check"

  query = <<EOF
    "nginx.can_connect".over${module.filter-tags.service_check}.by("host","port","server").last(1).pct_by_status()
  EOF

  thresholds = {
    warning  = 0
    critical = "${var.nginx_connect_threshold_critical}"
  }

  notify_no_data      = true
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.nginx_connect_silenced}"

  tags = ["env:${var.environment}", "type:middleware", "provider:nginx", "resource:nginx", "team:claranet", "created-by:terraform", "${var.nginx_connect_extra_tags}"]
}
