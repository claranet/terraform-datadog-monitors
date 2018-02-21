resource "datadog_monitor" "Nginx_process" {
  name    = "[${var.environment}] Nginx process is down on {{host.name}}"
  message = "${var.message}"

  type  = "service check"
  query = "\"process.up\".over(\"dd_monitoring:enabled\",\"dd_nginx:enabled\",\"process:nginx\",\"env:${var.environment}\").by(\"host\",\"process\", \"app\").last(4).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "type:nginx"]
}
