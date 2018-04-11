resource "datadog_monitor" "datadog_apache_process" {
  name    = "[${var.environment}] Can't connect to apache vhost status"
  message = "${coalesce(var.apache_connect_message, var.message)}"

  type = "service check"

  query = "\"apache.can_connect\".over(\"dd_apache:enabled\",\"dd_monitoring:enabled\",\"env:${var.environment}\").by(\"host\",\"port\").last(6).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20

  silenced = "${var.apache_connect_silenced}"

  tags = ["env:${var.environment}", "resource:apache"]
}
