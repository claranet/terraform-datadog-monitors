resource "datadog_monitor" "status" {
  count   = "${var.status_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Serverfarm is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.web_serverfarms.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) != 1
  EOQ

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:serverfarms", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "cpu_percentage" {
  count   = "${var.cpu_percentage_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Serverfarm CPU percentage is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_percentage_message, var.message)}"

  query = <<EOQ
    ${var.cpu_percentage_time_aggregator}(${var.cpu_percentage_timeframe}): (
      avg:azure.web_serverfarms.cpu_percentage${module.filter-tags.query_alert} by {resource_group,region,name,instance}
    ) > ${var.cpu_percentage_threshold_critical}
  EOQ

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_percentage_threshold_warning}"
    critical = "${var.cpu_percentage_threshold_critical}"
  }

  silenced = "${var.cpu_percentage_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:serverfarms", "team:claranet", "created-by:terraform", "${var.cpu_percentage_extra_tags}"]
}

resource "datadog_monitor" "memory_percentage" {
  count   = "${var.memory_percentage_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Serverfarm memory percentage is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_percentage_message, var.message)}"

  query = <<EOQ
    ${var.memory_percentage_time_aggregator}(${var.memory_percentage_timeframe}): (
      avg:azure.web_serverfarms.memory_percentage${module.filter-tags.query_alert} by {resource_group,region,name,instance}
    ) > ${var.memory_percentage_threshold_critical}
  EOQ

  type = "metric alert"

  thresholds {
    warning  = "${var.memory_percentage_threshold_warning}"
    critical = "${var.memory_percentage_threshold_critical}"
  }

  silenced = "${var.memory_percentage_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:serverfarms", "team:claranet", "created-by:terraform", "${var.memory_percentage_extra_tags}"]
}
