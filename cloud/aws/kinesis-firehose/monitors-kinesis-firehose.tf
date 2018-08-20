### Kinesis Firehose Incoming records ###
resource "datadog_monitor" "firehose_incoming_records" {
  name    = "[${var.environment}] Kinesis Firehose No incoming records"
  message = "${coalesce(var.incoming_records_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    sum(${var.incoming_records_timeframe}): (
      avg:aws.firehose.incoming_records${module.filter-tags.query_alert} by {region,deliverystreamname}
    ) <= 0
  EOF

  thresholds {
    critical = 0
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.incoming_records_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:kinesis-firehose", "team:claranet", "created-by:terraform", "${var.incoming_records_extra_tags}"]
}
