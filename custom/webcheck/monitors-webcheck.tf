data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_custom_webcheck:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "custom_webcheck_error" {
  name    = "[${var.environment}] Custom WebCheck has error(s)"
  message = "${coalesce(var.custom_webcheck_error_message, var.message)}"

  query = <<EOF
      ${var.custom_webcheck_error_aggregator}(${var.custom_webcheck_error_timeframe}):
      max:custom.webcheck.errors{${data.template_file.filter.rendered}} by {host,dd_custom_webcheck_scenario}
      >= 1
  EOF

  thresholds {
    critical = 1
  }

  type = "metric alert"

  notify_no_data      = true
  renotify_interval   = 0
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false

  silenced = "${var.custom_webcheck_error_silenced}"

  tags = ["env:${var.environment}", "resource:custom_webcheck"]
}

resource "datadog_monitor" "custom_webcheck_latency" {
  name    = "[${var.environment}] Custom WebCheck latency is too high"
  message = "${coalesce(var.custom_webcheck_latency_message, var.message)}"

  query = <<EOF
      ${var.custom_webcheck_latency_aggregator}(${var.custom_webcheck_latency_timeframe}):
      max:custom.webcheck.avg{${data.template_file.filter.rendered}} by {host,dd_custom_webcheck_scenario}
      >= ${var.custom_webcheck_latency_critical}
  EOF

  thresholds {
    critical = "${var.custom_webcheck_latency_critical}"
    warning  = "${var.custom_webcheck_latency_warning}"
  }

  type = "metric alert"

  notify_no_data      = true
  renotify_interval   = 0
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  require_full_window = false

  silenced = "${var.custom_webcheck_latency_silenced}"

  tags = ["env:${var.environment}", "resource:custom_webcheck"]
}

