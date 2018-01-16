resource "datadog_monitor" "base_monitor" {
  name    = "[${var.environment}] ${var.name}"
  message = "${var.message}"

  query = "${var.query}"

  thresholds = "${var.thresholds}"

  type                = "${var.type}"
  notify_no_data      = "${var.notify_no_data}"
  notify_audit        = false
  timeout_h           = "${var.timeout_h}"
  include_tags        = true
  locked              = true
  require_full_window = "${var.require_full_window}"
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  no_data_timeframe   = "${var.no_data_timeframe}"

  tags = "${concat(
        list("env:${var.environment}", "resource:${var.resource_name}", "team:${var.provider}", "provider:${var.provider}"),
        formatlist("%s:%s", keys(var.extra_tags), values(var.extra_tags))
      )}"
}
