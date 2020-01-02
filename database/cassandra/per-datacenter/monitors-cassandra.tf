resource "datadog_monitor" "datadog_monitor_cassandra_outliers_latency" {
  count   = var.cassandra_outliers_latency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra datacenter:${var.cassandra_datacenter_name} outliers_latency {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cassandra_outliers_latency_status_message, var.message)
  type    = "query alert"


  query = <<EOQ
  ${var.cassandra_outliers_latency_time_aggregator}(${var.cassandra_outliers_latency_timeframe}):
   outliers(avg:cassandra.latency.75th_percentile{datacenter:${var.cassandra_datacenter_name}} by {host}, 'scaledMAD', 5, 90) > 0
EOQ

  notify_no_data      = false
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.cassandra_outliers_latency_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}
