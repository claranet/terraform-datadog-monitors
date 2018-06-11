data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_elasticache_redis:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

module "datadog-monitors-aws-elasticache-common" {
  source = "../common"

  message     = "${var.message}"
  environment = "${var.environment}"
  filter_tags = "${data.template_file.filter.rendered}"
  resource    = "redis"

  eviction_message         = "${var.eviction_message}"
  eviction_silenced        = "${var.eviction_silenced}"
  eviction_time_aggregator = "${var.eviction_time_aggregator}"
  eviction_timeframe       = "${var.eviction_timeframe}"

  free_memory_condition_timeframe = "${var.free_memory_condition_timeframe}"
  free_memory_timeframe           = "${var.free_memory_timeframe}"
  free_memory_message             = "${var.free_memory_message}"
  free_memory_silenced            = "${var.free_memory_silenced}"
  free_memory_threshold_critical  = "${var.free_memory_threshold_critical}"
  free_memory_threshold_warning   = "${var.free_memory_threshold_warning}"

  max_connection_message         = "${var.max_connection_message}"
  max_connection_silenced        = "${var.max_connection_silenced}"
  max_connection_time_aggregator = "${var.max_connection_time_aggregator}"
  max_connection_timeframe       = "${var.max_connection_timeframe}"

  no_connection_message         = "${var.no_connection_message}"
  no_connection_silenced        = "${var.no_connection_silenced}"
  no_connection_time_aggregator = "${var.no_connection_time_aggregator}"
  no_connection_timeframe       = "${var.no_connection_timeframe}"

  swap_message            = "${var.swap_message}"
  swap_silenced           = "${var.swap_silenced}"
  swap_threshold_critical = "${var.swap_threshold_critical}"
  swap_threshold_warning  = "${var.swap_threshold_warning}"
  swap_time_aggregator    = "${var.swap_time_aggregator}"
  swap_timeframe          = "${var.swap_timeframe}"
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
    ) * 100 < ${var.cache_hits_threshold_critical}
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
      avg:aws.elasticache.engine_cpuutilization{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}
    ) > ${var.cpu_high_threshold_critical}
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

  silenced = "${var.cpu_high_silenced}"

  tags = ["env:${var.environment}", "engine:redis", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "redis_replication_lag" {
  name    = "[${var.environment}] Elasticache redis replication lag {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${coalesce(var.replication_lag_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.replication_lag_time_aggregator}(${var.replication_lag_timeframe}): (
      avg:aws.elasticache.replication_lag{${data.template_file.filter.rendered}} by {region,cacheclusterid,cachenodeid}
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
      avg:aws.elasticache.get_type_cmds{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count() +
      avg:aws.elasticache.set_type_cmds{${data.template_file.filter.rendered}} by {region,cacheclusterid}.as_count()
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
