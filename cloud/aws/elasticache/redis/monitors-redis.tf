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

resource "datadog_monitor" "redis_cache_hits" {
  name    = "[${var.environment}] Elasticache redis cache hits {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cache_hits_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    sum(${var.cache_hits_timeframe}): (
      avg:aws.elasticache.cache_hits{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count() /
      (avg:aws.elasticache.cache_hits{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count() +
        avg:aws.elasticache.cache_misses{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count())
    ) < ${var.cache_hits_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.cache_hits_threshold_warning}"
    critical = "${var.cache_hits_threshold_critical}"
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

  silenced = "${var.cache_hits_silenced}"

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_cpu_high" {
  name    = "[${var.environment}] Elasticache redis CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_high_time_aggregator}(${var.cpu_high_timeframe}): (
      avg:aws.elasticache.cpuutilization{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}
    ) > ( ${var.cpu_high_threshold_critical} / ${local.core[var.elasticache_size]} )
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

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_swap" {
  name    = "[${var.environment}] Elasticache redis is starting to swap ({{value}}MB)"
  message = "${coalesce(var.swap_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.swap_time_aggregator}(${var.swap_timeframe}): (
      avg:aws.elasticache.swap_usage{${data.template_file.filter.rendered}} by {region,cacheclusterid}
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

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_replication_lag" {
  name    = "[${var.environment}] Elasticache redis replication lag {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.replication_lag_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.replication_lag_time_aggregator}(${var.replication_lag_timeframe}): (
      avg:aws.elasticache.swap_usage{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}
    ) > ${var.replication_lag_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.replication_lag_threshold_warning}"
    critical = "${var.replication_lag_threshold_critical}"
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

  silenced = "${var.replication_lag_silenced}"

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_commands" {
  name    = "[${var.environment}] Elasticache redis is receiving no commands"
  message = "${coalesce(var.commands_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    sum(${var.commands_timeframe}): (
      avg:aws.elasticache.get_type_cmds{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}.as_count() +
      avg:aws.elasticache.set_type_cmds{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}.as_count()
    ) <= 0
  EOF

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.commands_silenced}"

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_free_memory" {
  name    = "[${var.environment}] Elasticache redis free memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_memory_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.free_memory_time_aggregator}(${var.free_memory_timeframe}): (
      avg:aws.elasticache.freeable_memory{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid} /
      ( ${local.memory[var.elasticache_size]} / ${var.nodes} )
    ) * 100 < ${var.free_memory_threshold_critical}
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

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}
