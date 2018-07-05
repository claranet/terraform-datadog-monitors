#
# Available Slots
#
variable "available_slots_message" {
  description = "Custom message for the Available Slots monitor"
  type        = "string"
  default     = ""
}

variable "available_slots_timeframe" {
  description = "Timeframe for the Available Slots monitor"
  type        = "string"
  default     = "last_5m"
}

variable "available_slots_threshold_warning" {
  description = "Available Slots (warning threshold)"
  type        = "string"
  default     = 300
}

variable "available_slots_threshold_critical" {
  description = "Available Slots (critical threshold)"
  type        = "string"
  default     = 200
}

variable "available_slots_silenced" {
  description = "Groups to mute for GCP Big Query Available Slots monitor."
  type        = "map"
  default     = {}
}

variable "available_slots_extra_tags" {
  description = "Extra tags for GCP Big Query Available Slots monitor"
  type        = "list"
  default     = []
}

resource "datadog_monitor" "available_slots" {
  name    = "[${var.environment}] GCP Big Query Available Slots close to the limit {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.available_slots_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.available_slots_timeframe}): avg:gcp.bigquery.slots.total_available{${data.template_file.filter.rendered}}
  < ${var.available_slots_threshold_critical}
EOF

  thresholds {
    warning  = "${var.available_slots_threshold_warning}"
    critical = "${var.available_slots_threshold_critical}"
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
  silenced            = "${var.available_slots_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "${var.available_slots_extra_tags}",
  ]
}
