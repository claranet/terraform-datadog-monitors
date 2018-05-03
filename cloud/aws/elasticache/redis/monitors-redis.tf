data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_red:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "redis_cache_miss" {
  name    = "[${var.environment}] Elasticache Redis cache miss {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cache_miss_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cache_miss_aggregator}(${var.cache_miss_timeframe}): (
      ${var.cache_miss_aggregator}:aws.elasticache.cache_misses{${data.template_file.filter.rendered}} by {region,name} /
      (${var.cache_miss_aggregator}:aws.elasticache.cache_hits{${data.template_file.filter.rendered}} by {region,name} +
        ${var.cache_miss_aggregator}:aws.elasticache.cache_misses{${data.template_file.filter.rendered}} by {region,name})
    ) > ${var.cache_miss_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.cache_miss_threshold_warning}"
    critical = "${var.cache_miss_threshold_critical}"
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

  silenced = "${var.cache_miss_silenced}"

  tags = ["env:${var.environment}", "resource:redis", "team:aws", "provider:aws"]
}
