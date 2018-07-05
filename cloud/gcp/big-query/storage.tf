#
# Stored Bytes 
#
variable "stored_bytes_message" {
  description = "Custom message for the Stored Bytes monitor"
  type        = "string"
  default     = ""
}

variable "stored_bytes_timeframe" {
  description = "Timeframe for the Stored Bytes monitor"
  type        = "string"
  default     = "last_5m"
}

variable "stored_bytes_threshold_warning" {
  description = "Stored Bytes in fraction (warning threshold)"
  type        = "string"
  default     = 0
}

variable "stored_bytes_threshold_critical" {
  description = "Stored Bytes in fraction (critical threshold)"
  type        = "string"
  default     = 1
}

variable "stored_bytes_silenced" {
  description = "Groups to mute for GCP Big Query Stored Bytes monitor. Muted by default."
  type        = "map"

  default = {
    "*" = 0
  }
}

variable "stored_bytes_extra_tags" {
  description = "Extra tags for GCP Big Query Stored Bytes monitor"
  type        = "list"
  default     = []
}

resource "datadog_monitor" "stored_bytes" {
  name    = "[${var.environment}] GCP Big Query Stored Bytes too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.stored_bytes_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.stored_bytes_timeframe}): avg:gcp.bigquery.storage.stored_bytes{${data.template_file.filter.rendered}}
  by {dataset_id,table}
  > ${var.stored_bytes_threshold_critical}
EOF

  thresholds {
    warning  = "${var.stored_bytes_threshold_warning}"
    critical = "${var.stored_bytes_threshold_critical}"
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
  silenced            = "${var.stored_bytes_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "${var.stored_bytes_extra_tags}",
  ]
}
