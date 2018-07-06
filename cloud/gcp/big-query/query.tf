#
# Concurrent queries
#
variable "concurrent_queries_message" {
  description = "Custom message for the Concurrent Queries monitor"
  type        = "string"
  default     = ""
}

variable "concurrent_queries_timeframe" {
  description = "Timeframe for the Concurrent Queries monitor"
  type        = "string"
  default     = "last_5m"
}

variable "concurrent_queries_threshold_warning" {
  description = "Concurrent Queries (warning threshold) (hard limit 50)"
  type        = "string"
  default     = 40
}

variable "concurrent_queries_threshold_critical" {
  description = "Concurrent Queries (critical threshold) (hard limit 50)"
  type        = "string"
  default     = 45
}

variable "concurrent_queries_silenced" {
  description = "Groups to mute for GCP Big Query Concurrent Queries monitor"
  type        = "map"
  default     = {}
}

variable "concurrent_queries_extra_tags" {
  description = "Extra tags for GCP Big Query Concurrent Queries monitor"
  type        = "list"
  default     = []
}

resource "datadog_monitor" "concurrent_queries" {
  name    = "[${var.environment}] GCP Big Query Concurrent Queries close to the limit {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.concurrent_queries_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.concurrent_queries_timeframe}): avg:gcp.bigquery.query.count{${data.template_file.filter.rendered}}
  > ${var.concurrent_queries_threshold_critical}
EOF

  thresholds {
    warning  = "${var.concurrent_queries_threshold_warning}"
    critical = "${var.concurrent_queries_threshold_critical}"
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
  silenced            = "${var.concurrent_queries_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "${var.concurrent_queries_extra_tags}",
  ]
}

#
# Execution Time
#
variable "execution_time_message" {
  description = "Custom message for the Execution Time monitor"
  type        = "string"
  default     = ""
}

variable "execution_time_timeframe" {
  description = "Timeframe for the Execution Time monitor"
  type        = "string"
  default     = "last_5m"
}

variable "execution_time_threshold_warning" {
  description = "Average Execution Time in seconds (warning threshold)"
  type        = "string"
  default     = 100
}

variable "execution_time_threshold_critical" {
  description = "Average Execution Time in seconds (critical threshold)"
  type        = "string"
  default     = 150
}

variable "execution_time_silenced" {
  description = "Groups to mute for GCP Big Query Execution Time monitor. Muted by default."
  type        = "map"

  default = {
    "*" = 0
  }
}

variable "execution_time_extra_tags" {
  description = "Extra tags for GCP Big Query Execution Time monitor"
  type        = "list"
  default     = []
}

resource "datadog_monitor" "execution_time" {
  name    = "[${var.environment}] GCP Big Query Execution Time too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.execution_time_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.execution_time_timeframe}): avg:gcp.bigquery.query.execution_times.avg{${data.template_file.filter.rendered}}
  > ${var.execution_time_threshold_critical}
EOF

  thresholds {
    warning  = "${var.execution_time_threshold_warning}"
    critical = "${var.execution_time_threshold_critical}"
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
  silenced            = "${var.execution_time_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "${var.execution_time_extra_tags}",
  ]
}
