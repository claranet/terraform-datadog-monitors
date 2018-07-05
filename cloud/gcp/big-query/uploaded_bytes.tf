#
# Uploaded Bytes
#
variable "uploaded_bytes_message" {
  description = "Custom message for the Uploaded Bytes monitor"
  type        = "string"
  default     = ""
}

variable "uploaded_bytes_timeframe" {
  description = "Timeframe for the Uploaded Bytes monitor"
  type        = "string"
  default     = "last_4h"
}

variable "uploaded_bytes_threshold_warning" {
  description = "Uploaded Bytes in Bytes (warning threshold)"
  type        = "string"
  default     = 0
}

variable "uploaded_bytes_threshold_critical" {
  description = "Uploaded Bytes in Bytes (critical threshold)"
  type        = "string"
  default     = 1
}

variable "uploaded_bytes_silenced" {
  description = "Groups to mute for GCP Big Query Uploaded Bytes monitor. Muted by default."
  type        = "map"

  default = {
    "*" = 0
  }
}

variable "uploaded_bytes_extra_tags" {
  description = "Extra tags for GCP Big Query Uploaded Bytes monitor"
  type        = "list"
  default     = []
}

resource "datadog_monitor" "uploaded_bytes" {
  name    = "[${var.environment}] GCP Big Query Uploaded Bytes too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.uploaded_bytes_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.uploaded_bytes_timeframe}): avg:gcp.bigquery.storage.uploaded_bytes{${data.template_file.filter.rendered}}
  by {dataset_id,table}
  > ${var.uploaded_bytes_threshold_critical}
EOF

  thresholds {
    warning  = "${var.uploaded_bytes_threshold_warning}"
    critical = "${var.uploaded_bytes_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.uploaded_bytes_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "${var.uploaded_bytes_extra_tags}",
  ]
}
