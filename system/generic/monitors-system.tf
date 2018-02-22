data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_system:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "cpu_custom" {
  name    = "[${var.environment}] CPU too High {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"

  query = <<EOF
    min(${var.custom_cpu_period}): (
      avg:system.cpu.system{${data.template_file.filter.rendered}} by {region,host.name,host.ip} +
      avg:system.cpu.user{${data.template_file.filter.rendered}} by {region,host.name,host.ip}
    ) > ${var.custom_cpu_threshold_critical}"
  EOF

  type = "metric alert"

  thresholds = {
    warning  = "${var.custom_cpu_threshold_warning}"
    critical = "${var.custom_cpu_threshold_critical}"
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
}
