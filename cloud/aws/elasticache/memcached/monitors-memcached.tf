data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_mem:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

module "datadog-monitors-aws-elasticcache-common" {
  source = "../common"

  message     = "${var.message}"
  environment = "${var.environment}"
  filter_tags = "${data.template_file.filter.rendered}"
  resource    = "memcached"
}

resource "datadog_monitor" "memcached_cpu_high" {
  name    = "[${var.environment}] Elasticache memcached CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_high_aggregator}(${var.cpu_high_timeframe}): (
      ${var.cpu_high_aggregator}:aws.elasticache.cpuutilization{${data.template_file.filter.rendered}} by {region,cluster,node}
    ) > ${var.cpu_high_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.cpu_high_threshold_warning}"
    critical = "${var.cpu_high_threshold_critical}"
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

  silenced = "${var.cpu_high_silenced}"

  tags = ["env:${var.environment}", "resource:memcached", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "memcached_swap" {
  name    = "[${var.environment}] Elasticache memcached swap {{#is_alert}}{{{comparator}}} {{threshold}}MB ({{value}}MB){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}MB ({{value}}MB){{/is_warning}}"
  message = "${coalesce(var.swap_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.swap_aggregator}(${var.swap_timeframe}): (
      ${var.swap_aggregator}:aws.elasticache.swap_usage{${data.template_file.filter.rendered}} by {region,cluster}
    ) > ${var.swap_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.swap_threshold_warning}"
    critical = "${var.swap_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.swap_silenced}"

  tags = ["env:${var.environment}", "resource:memcached", "team:aws", "provider:aws"]
}
