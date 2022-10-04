### Kinesis Firehose Incoming records ###
resource "datadog_monitor" "firehose_incoming_records" {
  count   = var.incoming_records_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Kinesis Firehose No incoming records"
  message = coalesce(var.incoming_records_message, var.message)
  type    = "query alert"

  query = <<EOQ
    sum(${var.incoming_records_timeframe}): (
      avg:aws.firehose.incoming_records${module.filter-tags.query_alert} by {region,deliverystreamname}
    ) <= 0
EOQ

  monitor_thresholds {
    critical = 0
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.firehose_incoming_records_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:kinesis-firehose", "team:claranet", "created-by:terraform"], var.incoming_records_extra_tags)
}

