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

  thresholds = {
    critical = 0
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:kinesis-firehose", "team:claranet", "created-by:terraform"], var.incoming_records_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

