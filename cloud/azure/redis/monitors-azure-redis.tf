resource "datadog_monitor" "status" {
  name    = "[${var.environment}] Redis {{name}} is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.cache_redis.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) != 1
  EOF

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:redis", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "evictedkeys" {
  name    = "[${var.environment}] Redis too many evictedkeys {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.evictedkeys_limit_message, var.message)}"

  query = <<EOF
    ${var.evictedkeys_limit_time_aggregator}(${var.evictedkeys_limit_timeframe}): (
      avg:azure.cache_redis.evictedkeys${module.filter-tags.query_alert} by {resource_group,region,name}
     ) > ${var.evictedkeys_limit_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.evictedkeys_limit_threshold_warning}"
    critical = "${var.evictedkeys_limit_threshold_critical}"
  }

  silenced = "${var.evictedkeys_limit_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:redis", "team:claranet", "created-by:terraform", "${var.evictedkeys_limit_extra_tags}"]
}

resource "datadog_monitor" "percent_processor_time" {
  name    = "[${var.environment}] Redis processor time too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.percent_processor_time_message, var.message)}"

  query = <<EOF
    ${var.percent_processor_time_time_aggregator}(${var.percent_processor_time_timeframe}): (
      avg:azure.cache_redis.percent_processor_time${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.percent_processor_time_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.percent_processor_time_threshold_warning}"
    critical = "${var.percent_processor_time_threshold_critical}"
  }

  silenced = "${var.percent_processor_time_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:redis", "team:claranet", "created-by:terraform", "${var.percent_processor_time_extra_tags}"]
}

resource "datadog_monitor" "server_load" {
  name    = "[${var.environment}] Redis server load too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.server_load_rate_message, var.message)}"

  query = <<EOF
    ${var.server_load_rate_time_aggregator}(${var.server_load_rate_timeframe}): (
      avg:azure.cache_redis.server_load${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.server_load_rate_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.server_load_rate_threshold_warning}"
    critical = "${var.server_load_rate_threshold_critical}"
  }

  silenced = "${var.server_load_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:redis", "team:claranet", "created-by:terraform", "${var.server_load_rate_extra_tags}"]
}
