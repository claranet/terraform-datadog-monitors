resource "datadog_monitor" "redis_cache_hits" {
  count   = var.cache_hits_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache redis cache hit ratio {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cache_hits_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.cache_hits_time_aggregator}(${var.cache_hits_timeframe}): default(
      avg:aws.elasticache.cache_hits${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_rate() / (
        avg:aws.elasticache.cache_hits${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_rate() +
        avg:aws.elasticache.cache_misses${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_rate())
    * 100, 100) < ${var.cache_hits_threshold_critical}
EOQ

  thresholds = {
    warning = var.cache_hits_threshold_warning
    critical = var.cache_hits_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = false
  renotify_interval = 0
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache-redis", "team:claranet", "created-by:terraform", "engine:redis"], var.cache_hits_extra_tags)
}

resource "datadog_monitor" "redis_cpu_high" {
  count = var.cpu_high_enabled == "true" ? 1 : 0
  name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache redis CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_high_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.cpu_high_time_aggregator}(${var.cpu_high_timeframe}): (
      avg:aws.elasticache.engine_cpuutilization${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) > ${var.cpu_high_threshold_critical}
EOQ

evaluation_delay    = var.evaluation_delay
new_host_delay      = var.new_host_delay
notify_no_data      = true
renotify_interval   = 0
notify_audit        = false
timeout_h           = 0
include_tags        = true
locked              = false
require_full_window = false

tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache-redis", "team:claranet", "created-by:terraform", "engine:redis"], var.cpu_high_extra_tags)
}

resource "datadog_monitor" "redis_replication_lag" {
count   = var.replication_lag_enabled == "true" ? 1 : 0
name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache redis replication lag {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
message = coalesce(var.replication_lag_message, var.message)
type = "query alert"

query = <<EOQ
    ${var.replication_lag_time_aggregator}(${var.replication_lag_timeframe}): (
      avg:aws.elasticache.replication_lag${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) > ${var.replication_lag_threshold_critical}
EOQ

thresholds = {
warning = var.replication_lag_threshold_warning
critical = var.replication_lag_threshold_critical
}

evaluation_delay = var.evaluation_delay
new_host_delay = var.new_host_delay
notify_no_data = false
renotify_interval = 0
notify_audit = false
timeout_h = 0
include_tags = true
locked = false
require_full_window = false

tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache-redis", "team:claranet", "created-by:terraform", "engine:redis"], var.replication_lag_extra_tags)
}

resource "datadog_monitor" "redis_commands" {
count = var.commands_enabled == "true" ? 1 : 0
name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Elasticache redis is receiving no commands"
message = coalesce(var.commands_message, var.message)
type = "query alert"


query = <<EOQ
    sum(${var.commands_timeframe}): (
      avg:aws.elasticache.get_type_cmds${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_count() +
      avg:aws.elasticache.set_type_cmds${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_count()
    ) <= 0
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache-redis", "team:claranet", "created-by:terraform", "engine:redis"], var.commands_extra_tags)
}

