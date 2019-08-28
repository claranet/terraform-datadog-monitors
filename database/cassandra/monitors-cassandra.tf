resource "datadog_monitor" "datadog_node_cassandra_down" {
  count   = var.node_cassandra_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra node is down"
  message = coalesce(var.node_cassandra_status_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.node_cassandra_status_time_aggregator}(${var.node_cassandra_status_timeframe}): (
      avg:cassandra.nodetool.status.status${module.filter-tags.query_alert} by {datacenter,node_id}
    ) < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:cassandra", "resource:cassandra", "team:claranet", "created-by:terraform"], var.node_cassandra_availability_extra_tags)
}


resource "datadog_monitor" "datadog_cassandra_process_down" {
  count   = var.process_cassandra_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DSE Cassandra process is down"
  message = coalesce(var.process_cassandra_status_message, var.message)
  type    = "metric alert"

  query = "max(last_5m):min:system.processes.number${module.filter-tags-check-process.query_alert} by {host} < 1"

  thresholds = {
    critical = 1
  }

  notify_no_data      = true
  evaluation_delay    = 15
  new_host_delay      = 300
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:process", "provider:process-check", "resource:custom", "team:claranet", "created-by:terraform"], var.process_cassandra_availability_extra_tags)
}
