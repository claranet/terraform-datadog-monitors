data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_firehose:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

### Kinesis Firehose Incoming records ###
resource "datadog_monitor" "firehose_incoming_records" {
  name    = "[${var.environment}] Kinesis Firehose No incoming records"
  message = "${var.message}"

  type = "metric alert"

  query = <<EOF
  sum(${var.incoming_records_timeframe}): (
    avg:aws.firehose.incoming_records{${data.template_file.filter.rendered}} by {region,deliverystreamname}
  ) <= 0
EOF

  thresholds {
    critical = 0
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:kinesis-firehose", "team:aws", "provider:aws"]
}
