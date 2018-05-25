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

resource "datadog_monitor" "memcached_get_hits" {
  name    = "[${var.environment}] Elasticache memcached get hits {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.get_hits_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    sum(${var.get_hits_timeframe}): (
      avg:aws.elasticache.get_hits{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count() /
      (avg:aws.elasticache.get_hits{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count() +
        avg:aws.elasticache.get_misses{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count())
    ) < ${var.get_hits_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.get_hits_threshold_warning}"
    critical = "${var.get_hits_threshold_critical}"
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

  silenced = "${var.get_hits_silenced}"

  tags = ["env:${var.environment}", "resource:memcached", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "memcached_cpu_high" {
  name    = "[${var.environment}] Elasticache memcached CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_high_time_aggregator}(${var.cpu_high_timeframe}): (
      avg:aws.elasticache.cpuutilization{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}
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
    ${var.swap_time_aggregator}(${var.swap_timeframe}): (
      avg:aws.elasticache.swap_usage{${data.template_file.filter.rendered}} by {region,cacheclusterid}
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

resource "datadog_monitor" "memcached_free_memory" {
  name    = "[${var.environment}] Elasticache memcached free memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_memory_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.free_memory_time_aggregator}(${var.free_memory_timeframe}): (
      avg:aws.elasticache.freeable_memory{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid} /
      ${local.memory[var.elasticache_size]} * 100
    ) < ${var.free_memory_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.free_memory_threshold_warning}"
    critical = "${var.free_memory_threshold_critical}"
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

  silenced = "${var.free_memory_silenced}"

  tags = ["env:${var.environment}", "resource:memcached", "team:aws", "provider:aws"]
}
