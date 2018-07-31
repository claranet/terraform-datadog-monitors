data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_redis:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "redis_evictedkeys" {
  name    = "[${var.environment}] Redis too many evicted keys {{#is_alert}}{{{comparator}}} {{threshold}}% (+{{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% (+{{value}}%){{/is_warning}}"
  message = "${coalesce(var.evictedkeys_change_message, var.message)}"

  query = <<EOL
    change(${var.evictedkeys_change_time_aggregator}(${var.evictedkeys_change_timeframe}),${var.evictedkeys_change_timeframe}): (
      avg:redis.keys.evicted{${data.template_file.filter.rendered}} by {redis_host,redis_port}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_expirations" {
  name    = "[${var.environment}] Redis too many expired keys {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.expirations_rate_message, var.message)}"

  query = <<EOL
    ${var.expirations_rate_time_aggregator}(${var.expirations_rate_timeframe}): (
      avg:redis.expires.percent{${data.template_file.filter.rendered}} by {redis_host,redis_port}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_blocked_clients" {
  name    = "[${var.environment}] Redis too many blocked clients {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.blocked_clients_message, var.message)}"

  query = <<EOL
    ${var.blocked_clients_time_aggregator}(${var.blocked_clients_timeframe}): (
      sum:redis.clients.blocked{${data.template_file.filter.rendered}} by {redis_host,redis_port}
      / sum:redis.net.clients{${data.template_file.filter.rendered}} by {redis_host,redis_port}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_keyspace" {
  name    = "[${var.environment}] Redis keyspace seems full (no changes since ${var.keyspace_timeframe})"
  message = "${coalesce(var.keyspace_message, var.message)}"

  query = <<EOL
    ${var.keyspace_time_aggregator}(${var.keyspace_timeframe}): (
      abs(diff(avg:redis.keys{${data.template_file.filter.rendered}} by {redis_host,redis_port}))
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_mem_used" {
  name    = "[${var.environment}] Redis too many ram memory used {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mem_used_message, var.message)}"

  query = <<EOL
    ${var.mem_used_time_aggregator}(${var.mem_used_timeframe}): (
      avg:redis.mem.used{${data.template_file.filter.rendered}} by {redis_host,redis_port}
      / max:redis.mem.maxmemory{${data.template_file.filter.rendered}} by {redis_host,redis_port}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_mem_frag" {
  name    = "[${var.environment}] Redis memory ram fragmented {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mem_frag_message, var.message)}"

  query = <<EOL
    ${var.mem_frag_time_aggregator}(${var.mem_frag_timeframe}): (
      avg:redis.mem.fragmentation_ratio{${data.template_file.filter.rendered}} by {redis_host,redis_port}
     ) * 100 > ${var.mem_frag_threshold_critical}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_rejected_con" {
  name    = "[${var.environment}] Redis too many rejected connections {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.rejected_con_message, var.message)}"

  query = <<EOL
    change(${var.rejected_con_time_aggregator}(${var.rejected_con_timeframe}),${var.rejected_con_timeframe}): (
      avg:redis.net.rejected{${data.template_file.filter.rendered}} by {redis_host,redis_port}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_latency" {
  name    = "[${var.environment}] Redis latency is too high {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOL
    change(${var.latency_time_aggregator}(${var.latency_timeframe}),${var.latency_timeframe}): (
      avg:redis.info.latency_ms{${data.template_file.filter.rendered}} by {redis_host,redis_port}
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}

resource "datadog_monitor" "redis_hitrate" {
  name    = "[${var.environment}] Redis hitrate is too low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.hitrate_message, var.message)}"

  query = <<EOL
    ${var.hitrate_time_aggregator}(${var.hitrate_timeframe}): (
      sum:redis.stats.keyspace_hits{${data.template_file.filter.rendered}} by {redis_host,redis_port}
      / (sum:redis.stats.keyspace_hits{${data.template_file.filter.rendered}} by {redis_host,redis_port}
        + sum:redis.stats.keyspace_misses{${data.template_file.filter.rendered}} by {redis_host,redis_port})
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = [
    "created_by:terraform",
    "env:${var.environment}",
    "resource:redis",
  ]
}
