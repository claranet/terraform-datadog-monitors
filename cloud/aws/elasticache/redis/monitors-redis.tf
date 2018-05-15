data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_red:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

module "datadog-monitors-aws-elasticcache-common" {
  source = "../common"

  message     = "${var.message}"
  environment = "${var.environment}"
  filter_tags = "${data.template_file.filter.rendered}"
  resource    = "redis"
}

resource "datadog_monitor" "redis_cache_hit" {
  name    = "[${var.environment}] Elasticache redis cache hit {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cache_hit_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cache_hit_aggregator}(${var.cache_hit_timeframe}): (
      ${var.cache_hit_aggregator}:aws.elasticache.cache_hits{${data.template_file.filter.rendered}} by {region,cluster} /
      (${var.cache_hit_aggregator}:aws.elasticache.cache_hits{${data.template_file.filter.rendered}} by {region,cluster} +
        ${var.cache_hit_aggregator}:aws.elasticache.cache_misses{${data.template_file.filter.rendered}} by {region,cluster})
    ) < ${var.cache_hit_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.cache_hit_threshold_warning}"
    critical = "${var.cache_hit_threshold_critical}"
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

  silenced = "${var.cache_hit_silenced}"

  tags = ["env:${var.environment}", "resource:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_cpu_high" {
  name    = "[${var.environment}] Elasticache redis CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_high_aggregator}(${var.cpu_high_timeframe}): (
      ${var.cpu_high_aggregator}:aws.elasticache.cpuutilization{${data.template_file.filter.rendered}} by {region,cluster,node}
    ) > ( ${var.cpu_high_threshold_critical} / ${var.core[var.redis_size]} )
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

  tags = ["env:${var.environment}", "resource:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_swap" {
  name    = "[${var.environment}] Elasticache redis is starting to swap ({{value}}MB)"
  message = "${coalesce(var.swap_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.swap_aggregator}(${var.swap_timeframe}): (
      ${var.swap_aggregator}:aws.elasticache.swap_usage{${data.template_file.filter.rendered}} by {region,cluster}
    ) > 0
  EOF

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

  tags = ["env:${var.environment}", "resource:redis", "team:aws", "provider:aws"]
}
