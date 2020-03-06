# Read capacity utilization
resource "datadog_monitor" "provisioned_read_capacity_utilization" {
  count   = var.provisioned_read_capacity_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DynamoDB read capacity utilization has reached {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.provisioned_read_capacity_message, var.message)

  query = <<EOQ

    ${var.provisioned_read_capacity_time_aggregator}(${var.provisioned_read_capacity_timeframe}):
      avg:aws.dynamodb.aws.dynamodb.consumed_read_capacity_units${module.filter-tags.query_alert} by {region,tablename} /
      avg:aws.dynamodb.aws.dynamodb.provisioned_read_capacity_units${module.filter-tags.query_alert} by {region,tablename} * 100
      > ${var.provisioned_read_capacity_threshold_critical}
  EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  thresholds = {
    critical = var.provisioned_read_capacity_threshold_critical
    warning  = var.provisioned_read_capacity_threshold_warning
  }

  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:dynamodb", "team:claranet", "created-by:terraform"], var.provisioned_read_capacity_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Write capacity utilization
resource "datadog_monitor" "provisioned_write_capacity_utilization" {
  count   = var.provisioned_write_capacity_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] DynamoDB write capacity utilization has reached {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  type    = "metric alert"
  message = coalesce(var.provisioned_write_capacity_message, var.message)

  query = <<EOQ
    ${var.provisioned_write_capacity_time_aggregator}(${var.provisioned_write_capacity_timeframe}):
      avg:aws.dynamodb.aws.dynamodb.consumed_write_capacity_units${module.filter-tags.query_alert} by {region,tablename} /
      avg:aws.dynamodb.aws.dynamodb.provisioned_write_capacity_units${module.filter-tags.query_alert} by {region,tablename} * 100
      > ${var.provisioned_write_capacity_threshold_critical}
  EOQ

  evaluation_delay = var.evaluation_delay
  new_host_delay   = var.new_host_delay

  thresholds = {
    critical = var.provisioned_write_capacity_threshold_critical
    warning  = var.provisioned_write_capacity_threshold_warning
  }

  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:dynamodb", "team:claranet", "created-by:terraform"], var.provisioned_write_capacity_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}