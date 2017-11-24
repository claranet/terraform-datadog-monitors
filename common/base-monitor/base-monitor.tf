resource "datadog_monitor" "base_monitor" {
  name    = "[${var.environment}] ${var.name}"
  message = "${var.message}"

  query = "${var.query}"

  type                = "metric alert"
  notify_no_data      = "${var.notify_no_data}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:${var.resource_name}", "team:${var.provider}", "provider:${var.provider}"]

  count = "${var.warning_threshold == "" ? 1 : 0}"
}

resource "datadog_monitor" "base_monitor_with_warning" {
  name    = "[${var.environment}] ${var.name}"
  message = "${var.message}"

  query = "${var.query}"

  thresholds {
    critical = "${var.critical_threshold}"
    warning  = "${var.warning_threshold}"
  }

  type                = "metric alert"
  notify_no_data      = "${var.notify_no_data}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:${var.resource_name}", "team:${var.provider}", "provider:${var.provider}"]

  count = "${var.warning_threshold == "" ? 0 : 1}"
}
