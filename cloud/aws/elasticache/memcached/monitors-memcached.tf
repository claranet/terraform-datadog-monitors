data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_mem:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

module "datadog-monitors-aws-elasticcache" {
  source = "../."

  message     = "${var.message}"
  environment = "${var.environment}"
}

resource "datadog_monitor" "memcached_get_miss" {
  name    = "[${var.environment}] Elasticache Memcached get requests missed {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.get_requests_miss_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.get_requests_miss_aggregator}(${var.get_requests_miss_timeframe}): (
      ${var.get_requests_miss_aggregator}:aws.elasticache.get_misses{${data.template_file.filter.rendered}} by {region,name} /
      (${var.get_requests_miss_aggregator}:aws.elasticache.get_hits{${data.template_file.filter.rendered}} by {region,name} +
        ${var.get_requests_miss_aggregator}:aws.elasticache.get_misses{${data.template_file.filter.rendered}} by {region,name})
    ) > ${var.get_requests_miss_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.get_requests_miss_threshold_warning}"
    critical = "${var.get_requests_miss_threshold_critical}"
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

  silenced = "${var.get_requests_miss_silenced}"

  tags = ["env:${var.environment}", "resource:memcached", "team:aws", "provider:aws"]
}
