resource "datadog_monitor" "virtualmachine_status" {
  count = "${var.status_enabled == "true" ? 1 : 0}"

  name    = "[${var.environment}] Virtual Machine is unreachable"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOQ
      ${var.status_time_aggregator}(${var.status_timeframe}): (
        avg:azure.vm.status${module.filter-tags.query_alert} by {resource_group,region,name}
      ) < 1
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

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "virtualmachine_cpu_usage" {
  count   = "${var.cpu_usage_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Virtual Machine CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_usage_message, var.message)}"

  query = <<EOQ
    ${var.cpu_usage_time_aggregator}(${var.cpu_usage_timeframe}): (
      avg:azure.vm.percentage_cpu${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.cpu_usage_threshold_critical}
  EOQ

  type = "metric alert"

  thresholds {
    critical = "${var.cpu_usage_threshold_critical}"
    warning  = "${var.cpu_usage_threshold_warning}"
  }

  silenced = "${var.cpu_usage_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform", "${var.cpu_usage_extra_tags}"]
}

resource "datadog_monitor" "virtualmachine_credit_cpu_remaining_too_low" {
  count   = "${var.cpu_remaining_rate_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Virtual Machine credit CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_remaining_rate_message, var.message)}"

  query = <<EOQ
    ${var.cpu_remaining_rate_time_aggregator}(${var.cpu_remaining_rate_timeframe}):
    default(
      default(avg:azure.vm.cpu_credits_remaining${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 100) / (
      default(avg:azure.vm.cpu_credits_remaining${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 100) +
      default(avg:azure.vm.cpu_credits_consumed${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100 , 100) < ${var.cpu_remaining_rate_threshold_critical}
  EOQ

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_remaining_rate_threshold_warning}"
    critical = "${var.cpu_remaining_rate_threshold_critical}"
  }

  silenced = "${var.cpu_remaining_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform", "${var.cpu_remaining_rate_extra_tags}"]
}
