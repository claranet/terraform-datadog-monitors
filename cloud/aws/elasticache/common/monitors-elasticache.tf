resource "datadog_monitor" "elasticache_eviction" {
  name    = "[${var.environment}] Elasticache ${var.resource} eviction {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}"
  message = "${coalesce(var.eviction_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.eviction_aggregator}(${var.eviction_timeframe}): (
      ${var.eviction_aggregator}:aws.elasticache.evictions{${var.filter_tags}} by {region,cluster}
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

  silenced = "${var.eviction_silenced}"

  tags = ["env:${var.environment}", "resource:${var.resource}", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "elasticache_max_connection" {
  name    = "[${var.environment}] Elasticache ${var.resource} connections {{#is_alert}}{{{comparator}}} {{threshold}} {{/is_alert}}"
  message = "${coalesce(var.max_connection_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.max_connection_aggregator}(${var.max_connection_timeframe}): (
      ${var.max_connection_aggregator}:aws.elasticache.curr_connections{${var.filter_tags}} by {region,cluster}
    ) >= 65000
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

  silenced = "${var.max_connection_silenced}"

  tags = ["env:${var.environment}", "resource:${var.resource}", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "elasticache_no_connection" {
  name    = "[${var.environment}] Elasticache ${var.resource} connections {{#is_alert}}{{{comparator}}} {{threshold}} {{/is_alert}}"
  message = "${coalesce(var.no_connection_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.no_connection_aggregator}(${var.no_connection_timeframe}): (
      ${var.no_connection_aggregator}:aws.elasticache.curr_connections{${var.filter_tags}} by {region,cluster}
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

  silenced = "${var.no_connection_silenced}"

  tags = ["env:${var.environment}", "resource:${var.resource}", "team:aws", "provider:aws"]
}
