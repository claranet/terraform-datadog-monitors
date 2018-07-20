data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_redis:enabled,db_env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "redis_evictedkeys" {
  name    = "[${var.environment}] Redis too many evictedkeys {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.evictedkeys_limit_message, var.message)}"

  query = <<EOL
    ${var.evictedkeys_limit_time_aggregator}(${var.evictedkeys_limit_timeframe}): (
      avg:redis.keys.evicted{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.evictedkeys_limit_threshold_critical}
EOL

  type = "metric alert"

  thresholds {
    warning  = "${var.evictedkeys_limit_threshold_warning}"
    critical = "${var.evictedkeys_limit_threshold_critical}"
  }

  silenced = "${var.evictedkeys_limit_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_expirations" {
  name    = "[${var.environment}] Redis too many expired keys {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.expirations_limit_message, var.message)}"

  query = <<EOL
    ${var.expirations_limit_time_aggregator}(${var.expirations_limit_timeframe}): (
      avg:redis.expires.percent{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.expirations_limit_threshold_critical}
EOL

  type = "metric alert"

  thresholds {
    warning  = "${var.expirations_limit_threshold_warning}"
    critical = "${var.expirations_limit_threshold_critical}"
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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_blocked_clients" {
  name    = "[${var.environment}] Redis too many blocked clients {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.blocked_clients_message, var.message)}"

  query = <<EOL
    ${var.blocked_clients_time_aggregator}(${var.blocked_clients_timeframe}): (
      avg:redis.clients.blocked{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.blocked_clients_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_keyspace" {
  name    = "[${var.environment}] Redis keyspace seems full {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.keyspace_message, var.message)}"

  query = <<EOL
    ${var.keyspace_time_aggregator}(${var.keyspace_timeframe}): (
      avg:redis.key.length{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.keyspace_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_mem_used" {
  name    = "[${var.environment}] Redis too many ram memory used {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.mem_used_message, var.message)}"

  query = <<EOL
    ${var.mem_used_time_aggregator}(${var.mem_used_timeframe}): (
      avg:redis.mem.used{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.mem_used_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_mem_frag" {
  name    = "[${var.environment}] Redis memory ram fragmented {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.mem_frag_message, var.message)}"

  query = <<EOL
    ${var.mem_frag_time_aggregator}(${var.mem_frag_timeframe}): (
      avg:redis.mem.fragmentation_ratio{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.mem_frag_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_rejected_con" {
  name    = "[${var.environment}] Redis too many rejected connections {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.rejected_con_message, var.message)}"

  query = <<EOL
    pct_change(${var.rejected_con_time_aggregator}(${var.rejected_con_timeframe}),${var.rejected_con_timeframe}): (
      avg:redis.net.rejected{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.rejected_con_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_latency" {
  name    = "[${var.environment}] Redis latency is too high {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOL
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (
      avg:redis.info.latency_ms{${data.template_file.filter.rendered}} by {name,host}
     ) > ${var.latency_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}

resource "datadog_monitor" "redis_hitrate" {
  name    = "[${var.environment}] Redis hitrate is too low {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.hitrate_message, var.message)}"

  query = <<EOL
    ${var.hitrate_time_aggregator}(${var.hitrate_timeframe}): (
      avg:redis.stats.keyspace_hits{${data.template_file.filter.rendered}} by {name,host}
      / (avg:redis.stats.keyspace_hits{${data.template_file.filter.rendered}} by {name,host}
        + avg:redis.stats.keyspace_misses{${data.template_file.filter.rendered}} by {name,host})
     ) < ${var.hitrate_threshold_critical}
EOL

  type = "metric alert"

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

  tags = ["env:${var.environment}", "resource:redis"]
}
