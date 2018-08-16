resource "datadog_monitor" "datadog_apache_process" {
  name    = "[${var.environment}] Can't connect to apache vhost status"
  message = "${coalesce(var.apache_connect_message, var.message)}"

  type = "service check"

  query = <<EOF
    "apache.can_connect".over${module.filter-tags.service_check}.by("host","port","server").last(1).pct_by_status()
  EOF

  thresholds = {
    warning  = 0
    critical = 1.1754943508222875e-38
  }

  notify_no_data      = true
  new_host_delay      = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.apache_connect_silenced}"

  tags = ["env:${var.environment}", "resource:apache"]
}
