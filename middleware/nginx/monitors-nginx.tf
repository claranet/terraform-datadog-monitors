resource "datadog_monitor" "datadog_nginx_process" {
  name    = "[${var.environment}] Can't connect to nginx vhost status"
  message = "${coalesce(var.nginx_process_message, var.message)}"

  type  = "service check"
  query = "\"nginx.can_connect\".over(\"dd_monitoring:enabled\",\"dd_nginx:enabled\",\"env:${var.environment}\").by(\"host\",\"port\").last(6).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  silenced = "${var.nginx_process_silenced}"

  tags = ["env:${var.environment}", "resource:nginx"]
}
