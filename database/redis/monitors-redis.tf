#
# Service Check
#
resource "datadog_monitor" "not_responding" {
  count   = var.not_responding_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis does not respond"
  message = coalesce(var.not_responding_message, var.message)
  type    = "service check"

  query = <<EOQ
    "redis.can_connect"${module.filter-tags.service_check}.by("redis_host","redis_port").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.not_responding_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.not_responding_no_data_timeframe
  notify_no_data      = true
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.not_responding_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "evicted_keys" {
  count   = var.evictedkeys_change_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis evicted keys {{#is_alert}}{{{comparator}}} {{threshold}}% (+{{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% (+{{value}}%){{/is_warning}}"
  message = coalesce(var.evictedkeys_change_message, var.message)
  type    = "query alert"

  query = <<EOQ
    change(${var.evictedkeys_change_time_aggregator}(${var.evictedkeys_change_timeframe}),${var.evictedkeys_change_timeframe}): (
      avg:redis.keys.evicted${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.evictedkeys_change_threshold_critical}
EOQ

  thresholds = {
    warning  = var.evictedkeys_change_threshold_warning
    critical = var.evictedkeys_change_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.evictedkeys_change_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "expirations" {
  count   = var.expirations_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis high number of non-expiring keys {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.expirations_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.expirations_rate_time_aggregator}(${var.expirations_rate_timeframe}): (
      avg:redis.expires.percent${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) < ${var.expirations_rate_threshold_critical}
EOQ

  thresholds = {
    warning  = var.expirations_rate_threshold_warning
    critical = var.expirations_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.expirations_rate_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "blocked_clients" {
  count   = var.blocked_clients_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis blocked clients {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.blocked_clients_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.blocked_clients_time_aggregator}(${var.blocked_clients_timeframe}): (
      sum:redis.clients.blocked${module.filter-tags.query_alert} by {redis_host,redis_port}
      / sum:redis.net.clients${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) * 100 > ${var.blocked_clients_threshold_critical}
EOQ

  thresholds = {
    warning  = var.blocked_clients_threshold_warning
    critical = var.blocked_clients_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.blocked_clients_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "keyspace_full" {
  count   = var.keyspace_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis keyspace seems full (no changes since ${var.keyspace_timeframe})"
  message = coalesce(var.keyspace_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.keyspace_time_aggregator}(${var.keyspace_timeframe}): (
      abs(diff(avg:redis.keys${module.filter-tags.query_alert} by {redis_host,redis_port}))
     ) == ${var.keyspace_threshold_critical}
EOQ

  thresholds = {
    warning  = var.keyspace_threshold_warning
    critical = var.keyspace_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.keyspace_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "memory_used" {
  count   = var.mem_used_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis memory used {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.mem_used_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mem_used_time_aggregator}(${var.mem_used_timeframe}): (
      avg:redis.mem.used${module.filter-tags.query_alert} by {redis_host,redis_port}
      / max:redis.mem.maxmemory${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) * 100 > ${var.mem_used_threshold_critical}
EOQ

  thresholds = {
    warning  = var.mem_used_threshold_warning
    critical = var.mem_used_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.mem_used_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "memory_frag" {
  count   = var.mem_frag_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis memory fragmented {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.mem_frag_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mem_frag_time_aggregator}(${var.mem_frag_timeframe}):
      avg:redis.mem.fragmentation_ratio${module.filter-tags.query_alert} by {redis_host,redis_port}
     * 100 > ${var.mem_frag_threshold_critical}
EOQ

  thresholds = {
    warning  = var.mem_frag_threshold_warning
    critical = var.mem_frag_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.mem_frag_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "rejected_connections" {
  count   = var.rejected_con_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis rejected connections {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.rejected_con_message, var.message)
  type    = "query alert"

  query = <<EOQ
    change(${var.rejected_con_time_aggregator}(${var.rejected_con_timeframe}),${var.rejected_con_timeframe}): (
      avg:redis.net.rejected${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.rejected_con_threshold_critical}
EOQ

  thresholds = {
    warning  = var.rejected_con_threshold_warning
    critical = var.rejected_con_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.rejected_con_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "latency" {
  count   = var.latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}){{/is_warning}}"
  message = coalesce(var.latency_message, var.message)
  type    = "query alert"

  query = <<EOQ
    change(${var.latency_time_aggregator}(${var.latency_timeframe}),${var.latency_timeframe}): (
      avg:redis.info.latency_ms${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.latency_threshold_critical}
EOQ

  thresholds = {
    warning  = var.latency_threshold_warning
    critical = var.latency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.latency_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "hitrate" {
  count   = var.hitrate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Redis hitrate {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.hitrate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.hitrate_time_aggregator}(${var.hitrate_timeframe}): (
      sum:redis.stats.keyspace_hits${module.filter-tags.query_alert} by {redis_host,redis_port}
      / (sum:redis.stats.keyspace_hits${module.filter-tags.query_alert} by {redis_host,redis_port}
        + sum:redis.stats.keyspace_misses${module.filter-tags.query_alert} by {redis_host,redis_port})
     ) * 100 < ${var.hitrate_threshold_critical}
EOQ

  thresholds = {
    warning  = var.hitrate_threshold_warning
    critical = var.hitrate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform"], var.hitrate_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

