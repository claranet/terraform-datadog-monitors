data "template_file" "name" {
  template = "$${filter}"

  vars {
    filter = "${var.name_use_defaults == "true" ?
             format("{{#is_alert}} {{{comparator}}} {{threshold}}{{/is_alert}}{{#is_warning}} {{{comparator}}} {{warn_threshold}}{{/is_warning}}%s ({{value}}%s", var.thresholds_unit, var.thresholds_unit) : ""}"
  }
}

resource "datadog_monitor" "base_monitor" {
  name    = "[${var.environment}] ${var.name}${data.template_file.name.rendered}"
  message = "${var.message}"

  query = "${var.query}"

  type = "${var.type}"

  thresholds = "${var.thresholds}"

  silenced = "${var.silenced}"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = "${var.timeout_h}"
  include_tags        = true
  locked              = false
  require_full_window = "${var.require_full_window}"
  new_host_delay      = "${var.new_host_delay}"

  tags = "${concat(
        list("env:${var.environment}", "resource:${var.resource_kind}", "team:${var.provider}", "provider:${var.provider}"),
        formatlist("%s:%s", keys(var.extra_tags), values(var.extra_tags))
      )}"
}
