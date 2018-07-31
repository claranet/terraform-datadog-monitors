#
# FILTER
#
data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
              format("project_id:%s", var.project_id) :
             "${var.filter_tags_custom}"}"
  }
}

#
# Concurrent queries
#
resource "datadog_monitor" "concurrent_queries" {
  count = "${var.concurrent_queries_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Concurrent Queries {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.concurrent_queries_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.concurrent_queries_extra_tags}",
  ]
}

#
# Execution Time
#
resource "datadog_monitor" "execution_time" {
  count = "${var.execution_time_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Execution Time {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.execution_time_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.execution_time_extra_tags}",
  ]
}

#
# Scanned Bytes
#
resource "datadog_monitor" "scanned_bytes" {
  count = "${var.scanned_bytes_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Scanned Bytes {{#is_alert}}{{{comparator}}} {{threshold}}B/mn ({{value}}B/mn){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}B/mn ({{value}}B/mn){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.scanned_bytes_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.scanned_bytes_extra_tags}",
  ]
}

#
# Scanned Bytes Billed
#
resource "datadog_monitor" "scanned_bytes_billed" {
  count = "${var.scanned_bytes_billed_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Scanned Bytes Billed {{#is_alert}}{{{comparator}}} {{threshold}}B/mn ({{value}}B/mn){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}B/mn ({{value}}B/mn){{/is_warning}}"
  message = "${coalesce(var.scanned_bytes_billed_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.scanned_bytes_billed_timeframe}): avg:gcp.bigquery.query.scanned_bytes_billed{${data.template_file.filter.rendered}}
  > ${var.scanned_bytes_billed_threshold_critical}
EOF

  thresholds {
    warning  = "${var.scanned_bytes_billed_threshold_warning}"
    critical = "${var.scanned_bytes_billed_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  locked              = false

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.scanned_bytes_billed_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.scanned_bytes_billed_extra_tags}",
  ]
}

#
# Available Slots
#
resource "datadog_monitor" "available_slots" {
  count = "${var.available_slots_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Available Slots {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.available_slots_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.available_slots_extra_tags}",
  ]
}

#
# Stored Bytes
#
resource "datadog_monitor" "stored_bytes" {
  count = "${var.stored_bytes_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Stored Bytes {{#is_alert}}{{{comparator}}} {{threshold}}B ({{value}}B){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}B ({{value}}B){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.stored_bytes_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.stored_bytes_extra_tags}",
  ]
}

#
# Table Count
#
resource "datadog_monitor" "table_count" {
  count = "${var.table_count_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Table Count {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.table_count_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.table_count_extra_tags}",
  ]
}

#
# Uploaded Bytes
#
resource "datadog_monitor" "uploaded_bytes" {
  count = "${var.uploaded_bytes_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Uploaded Bytes {{#is_alert}}{{{comparator}}} {{threshold}}B/mn ({{value}}B/mn){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}B/mn ({{value}}B/mn){{/is_warning}}"
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

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.uploaded_bytes_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.uploaded_bytes_extra_tags}",
  ]
}

#
# Uploaded Bytes Billed
#
resource "datadog_monitor" "uploaded_bytes_billed" {
  count = "${var.uploaded_bytes_billed_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] GCP Big Query Uploaded Bytes Billed {{#is_alert}}{{{comparator}}} {{threshold}}B/mn ({{value}}B/mn){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}B/mn ({{value}}B/mn){{/is_warning}}"
  message = "${coalesce(var.uploaded_bytes_billed_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.uploaded_bytes_billed_timeframe}): avg:gcp.bigquery.storage.uploaded_bytes{${data.template_file.filter.rendered}}
  by {dataset_id,table}
  > ${var.uploaded_bytes_billed_threshold_critical}
EOF

  thresholds {
    warning  = "${var.uploaded_bytes_billed_threshold_warning}"
    critical = "${var.uploaded_bytes_billed_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = false
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  locked              = false

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.uploaded_bytes_billed_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:big-query",
    "created_by:terraform",
    "${var.uploaded_bytes_billed_extra_tags}",
  ]
}
