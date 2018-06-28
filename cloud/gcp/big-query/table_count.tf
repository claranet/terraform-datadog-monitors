#
# Table Count
#
variable "table_count_message" {
  description = "Custom message for the Table Count monitor"
  type        = "string"
  default     = ""
}

variable "table_count_timeframe" {
  description = "Timeframe for the Table Count monitor"
  type        = "string"
  default     = "last_4h"
}

variable "table_count_threshold_warning" {
  description = "Table Count (warning threshold)"
  type        = "string"
  default     = 0
}

variable "table_count_threshold_critical" {
  description = "Table Count (critical threshold)"
  type        = "string"
  default     = 1
}

variable "table_count_silenced" {
  description = "Groups to mute for GCP Big Query Table Count monitor. Muted by default."
  type        = "map"

  default = {
    "*" = 0
  }
}

resource "datadog_monitor" "table_count" {
  name    = "[${var.environment}] GCP Big Query Table Count too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.table_count_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.table_count_timeframe}): avg:gcp.bigquery.storage.table_count{${data.template_file.filter.rendered}}
  by {dataset_id}
  > ${var.table_count_threshold_critical}
EOF

  thresholds {
    warning  = "${var.table_count_threshold_warning}"
    critical = "${var.table_count_threshold_critical}"
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
  silenced            = "${var.table_count_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
  ]
}
