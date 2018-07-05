#
# Scanned Bytes
#
variable "scanned_bytes_message" {
  description = "Custom message for the Scanned Bytes monitor"
  type        = "string"
  default     = ""
}

variable "scanned_bytes_timeframe" {
  description = "Timeframe for the Scanned Bytes monitor"
  type        = "string"
  default     = "last_4h"
}

variable "scanned_bytes_threshold_warning" {
  description = "Scanned Bytes Bytes (warning threshold)"
  type        = "string"
  default     = 0
}

variable "scanned_bytes_threshold_critical" {
  description = "Scanned Bytes Bytes (critical threshold)"
  type        = "string"
  default     = 1
}

variable "scanned_bytes_silenced" {
  description = "Groups to mute for GCP Big Query Scanned Bytes monitor. Muted by default."
  type        = "map"

  default = {
    "*" = 0
  }
}

variable "scanned_bytes_extra_tags" {
  description = "Extra tags for GCP Big Query Scanned Bytes monitor"
  type        = "list"
  default     = []
}

resource "datadog_monitor" "scanned_bytes" {
  name    = "[${var.environment}] GCP Big Query Scanned Bytes too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.scanned_bytes_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.scanned_bytes_timeframe}): avg:gcp.bigquery.query.scanned_bytes{${data.template_file.filter.rendered}}
  > ${var.scanned_bytes_threshold_critical}
EOF

  thresholds {
    warning  = "${var.scanned_bytes_threshold_warning}"
    critical = "${var.scanned_bytes_threshold_critical}"
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
  silenced            = "${var.scanned_bytes_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "${var.scanned_bytes_extra_tags}",
  ]
}
