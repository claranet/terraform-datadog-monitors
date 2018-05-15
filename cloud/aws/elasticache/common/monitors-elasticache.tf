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
