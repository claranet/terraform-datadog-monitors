data "template_file" "name" {
  template = "$${filter}"

  vars {
    filter = "${var.name_use_defaults == "true" ?
             format("{{#is_alert}} {{{comparator}}} {{threshold}}{{/is_alert}}{{#is_warning}} {{{comparator}}} {{warn_threshold}}{{/is_warning}}%s ({{value}}%s", var.thresholds_unit, var.thresholds_unit) : ""}"
  }
}

data "template_file" "filter" {
template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
              format("dd_monitoring:enabled,dd_azure_%s:enabled,env:%s", var.resource_kind, var.environment) :
              "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "base_monitor" {
  name = "[${var.environment}] ${var.name}${data.template_file.name.rendered}"

  message = "${var.message}"

  query = "${replace(var.query, "{{filter_tags}}", data.template_file.filter.rendered)}"

  type = "${var.type}"

  thresholds = "${var.thresholds}"

  silenced = "${var.silenced}"

  notify_no_data = "${var.notify_no_data}"
  evaluation_delay = "${var.evaluation_delay}"
  renotify_interval = 0
  notify_audit = false
  timeout_h = "${var.timeout_h}"
  include_tags = true
  locked = false
  require_full_window = "${var.require_full_window}"
  new_host_delay = "${var.new_host_delay}"

  tags = "${concat(
        list("env:${var.environment}", "resource:${var.resource_kind}", "team:${var.provider}", "provider:${var.provider}"),
        formatlist("%s:%s", keys(var.extra_tags), values(var.extra_tags))
      )}"
}
