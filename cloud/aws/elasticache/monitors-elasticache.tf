data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_es:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "elasticache_cpu_high" {
  name    = "[${var.environment}] Elasticache CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_aggregator}(${var.cpu_timeframe}): (
      ${var.cpu_aggregator}:aws.elasticache.cpuutilization{${data.template_file.filter.rendered}} by {region,name}
    ) > ${var.cpu_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.cpu_silenced}"

  tags = ["env:${var.environment}", "resource:elasticache", "team:aws", "provider:aws"]
}
