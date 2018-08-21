resource "datadog_monitor" "evicted_keys" {
  name    = "[${var.environment}] Redis evicted keys {{#is_alert}}{{{comparator}}} {{threshold}}% (+{{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% (+{{value}}%){{/is_warning}}"
  message = "${coalesce(var.evictedkeys_change_message, var.message)}"

  query = <<EOL
    change(${var.evictedkeys_change_time_aggregator}(${var.evictedkeys_change_timeframe}),${var.evictedkeys_change_timeframe}): (
      avg:redis.keys.evicted${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.evictedkeys_change_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.evictedkeys_change_threshold_warning}"
    critical = "${var.evictedkeys_change_threshold_critical}"
  }

  silenced = "${var.evictedkeys_change_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.evictedkeys_change_extra_tags}"]
}

resource "datadog_monitor" "expirations" {
  name    = "[${var.environment}] Redis expired keys {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.expirations_rate_message, var.message)}"

  query = <<EOL
    ${var.expirations_rate_time_aggregator}(${var.expirations_rate_timeframe}): (
      avg:redis.expires.percent${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.expirations_rate_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.expirations_rate_threshold_warning}"
    critical = "${var.expirations_rate_threshold_critical}"
  }

  silenced = "${var.expirations_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.expirations_extra_tags}"]
}

resource "datadog_monitor" "blocked_clients" {
  name    = "[${var.environment}] Redis blocked clients {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.blocked_clients_message, var.message)}"

  query = <<EOL
    ${var.blocked_clients_time_aggregator}(${var.blocked_clients_timeframe}): (
      sum:redis.clients.blocked${module.filter-tags.query_alert} by {redis_host,redis_port}
      / sum:redis.net.clients${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) * 100 > ${var.blocked_clients_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.blocked_clients_threshold_warning}"
    critical = "${var.blocked_clients_threshold_critical}"
  }

  silenced = "${var.blocked_clients_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.blocked_clients_extra_tags}"]
}

resource "datadog_monitor" "keyspace_full" {
  name    = "[${var.environment}] Redis keyspace seems full (no changes since ${var.keyspace_timeframe})"
  message = "${coalesce(var.keyspace_message, var.message)}"

  query = <<EOL
    ${var.keyspace_time_aggregator}(${var.keyspace_timeframe}): (
      abs(diff(avg:redis.keys${module.filter-tags.query_alert} by {redis_host,redis_port}))
     ) == ${var.keyspace_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.keyspace_threshold_warning}"
    critical = "${var.keyspace_threshold_critical}"
  }

  silenced = "${var.keyspace_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.keyspace_extra_tags}"]
}

resource "datadog_monitor" "memory_used" {
  name    = "[${var.environment}] Redis memory used {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mem_used_message, var.message)}"

  query = <<EOL
    ${var.mem_used_time_aggregator}(${var.mem_used_timeframe}): (
      avg:redis.mem.used${module.filter-tags.query_alert} by {redis_host,redis_port}
      / max:redis.mem.maxmemory${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) * 100 > ${var.mem_used_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.mem_used_threshold_warning}"
    critical = "${var.mem_used_threshold_critical}"
  }

  silenced = "${var.mem_used_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.mem_used_extra_tags}"]
}

resource "datadog_monitor" "memory_frag" {
  name    = "[${var.environment}] Redis memory fragmented {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mem_frag_message, var.message)}"

  query = <<EOL
    ${var.mem_frag_time_aggregator}(${var.mem_frag_timeframe}):
      avg:redis.mem.fragmentation_ratio${module.filter-tags.query_alert} by {redis_host,redis_port}
     * 100 > ${var.mem_frag_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.mem_frag_threshold_warning}"
    critical = "${var.mem_frag_threshold_critical}"
  }

  silenced = "${var.mem_frag_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.mem_frag_extra_tags}"]
}

resource "datadog_monitor" "rejected_connections" {
  name    = "[${var.environment}] Redis rejected connections {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.rejected_con_message, var.message)}"

  query = <<EOL
    change(${var.rejected_con_time_aggregator}(${var.rejected_con_timeframe}),${var.rejected_con_timeframe}): (
      avg:redis.net.rejected${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.rejected_con_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.rejected_con_threshold_warning}"
    critical = "${var.rejected_con_threshold_critical}"
  }

  silenced = "${var.rejected_con_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.rejected_con_extra_tags}"]
}

resource "datadog_monitor" "latency" {
  name    = "[${var.environment}] Redis latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOL
    change(${var.latency_time_aggregator}(${var.latency_timeframe}),${var.latency_timeframe}): (
      avg:redis.info.latency_ms${module.filter-tags.query_alert} by {redis_host,redis_port}
     ) > ${var.latency_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.latency_threshold_warning}"
    critical = "${var.latency_threshold_critical}"
  }

  silenced = "${var.latency_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.latency_extra_tags}"]
}

resource "datadog_monitor" "hitrate" {
  name    = "[${var.environment}] Redis hitrate {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.hitrate_message, var.message)}"

  query = <<EOL
    ${var.hitrate_time_aggregator}(${var.hitrate_timeframe}): (
      sum:redis.stats.keyspace_hits${module.filter-tags.query_alert} by {redis_host,redis_port}
      / (sum:redis.stats.keyspace_hits${module.filter-tags.query_alert} by {redis_host,redis_port}
        + sum:redis.stats.keyspace_misses${module.filter-tags.query_alert} by {redis_host,redis_port})
     ) * 100 < ${var.hitrate_threshold_critical}
EOL

  type = "metric alert"

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.hitrate_threshold_warning}"
    critical = "${var.hitrate_threshold_critical}"
  }

  silenced = "${var.hitrate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.hitrate_extra_tags}"]
}

#
# Service Check
#
resource "datadog_monitor" "not_responding" {
  name    = "[${var.environment}] Redis does not respond"
  message = "${coalesce(var.not_responding_message, var.message)}"

  query = <<EOL
    "redis.can_connect".over${module.filter-tags.service_check}.by(${var.not_responding_by}).last(${var.not_responding_last}).count_by_status()
EOL

  type = "service check"

  thresholds {
    warning  = "${var.not_responding_threshold_warning}"
    critical = "${var.not_responding_threshold_critical}"
    ok       = "${var.not_responding_threshold_ok}"
  }

  silenced = "${var.not_responding_silenced}"

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  notify_no_data      = true
  renotify_interval   = 0

  new_host_delay = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:database", "provider:redisdb", "resource:redis", "team:claranet", "created-by:terraform", "${var.not_responding_extra_tags}"]
}
