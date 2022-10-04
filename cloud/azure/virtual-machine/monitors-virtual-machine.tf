resource "datadog_monitor" "virtualmachine_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Virtual Machine is unreachable"
  message = coalesce(var.status_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.status_time_aggregator}(${var.status_timeframe}): (
        avg:azure.vm.count${module.filter-tags.query_alert} by {resource_group,region,name}
      ) < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.virtualmachine_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform"], var.status_extra_tags)
}

resource "datadog_monitor" "virtualmachine_cpu_usage" {
  count   = var.cpu_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Virtual Machine CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_usage_time_aggregator}(${var.cpu_usage_timeframe}): (
      avg:azure.vm.percentage_cpu${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.cpu_usage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cpu_usage_threshold_critical
    warning  = var.cpu_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform"], var.cpu_usage_extra_tags)
}

resource "datadog_monitor" "virtualmachine_credit_cpu_remaining_too_low" {
  count   = var.cpu_remaining_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Virtual Machine credit CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_remaining_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_remaining_rate_time_aggregator}(${var.cpu_remaining_rate_timeframe}):
    default(
      default(avg:azure.vm.cpu_credits_remaining${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 100) / (
      default(avg:azure.vm.cpu_credits_remaining${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 100) +
      default(avg:azure.vm.cpu_credits_consumed${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(), 0) )
      * 100 , 100) < ${var.cpu_remaining_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cpu_remaining_rate_threshold_warning
    critical = var.cpu_remaining_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform"], var.cpu_remaining_rate_extra_tags)
}

resource "datadog_monitor" "virtualmachine_ram_reserved" {
  count   = var.ram_reserved_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Virtual Machine RAM reserved {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.ram_reserved_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.ram_reserved_time_aggregator}(${var.ram_reserved_timeframe}):
      avg:azure.vm.memory_committed_bytes${module.filter-tags.query_alert} by {resource_group,region,name} / (
      avg:azure.vm.memory_committed_bytes${module.filter-tags.query_alert} by {resource_group,region,name} +
      avg:azure.vm.memory_available_bytes${module.filter-tags.query_alert} by {resource_group,region,name}) * 100
      > ${var.ram_reserved_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.ram_reserved_threshold_critical
    warning  = var.ram_reserved_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform"], var.ram_reserved_extra_tags)
}

resource "datadog_monitor" "virtualmachine_disk_space" {
  count   = var.disk_space_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Virtual Machine disk space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.disk_space_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.disk_space_time_aggregator}(${var.disk_space_timeframe}):
    100 - avg:azure.vm.logical_disk_total_pct_free_space${module.filter-tags.query_alert} by {resource_group,region,name}
    > ${var.disk_space_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.disk_space_threshold_warning
    critical = var.disk_space_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform"], var.disk_space_extra_tags)
}

resource "datadog_monitor" "virtualmachine_requests_failed" {
  count   = var.requests_failed_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Virtual Machine requests failed {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.requests_failed_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.requests_failed_time_aggregator}(${var.requests_failed_timeframe}):
      default( 
        default(avg:azure.vm.asp.net_applications_total_requests_failed${module.filter-tags.query_alert} by {resource_group,region,name}, 0) /
        default(avg:azure.vm.asp.net_applications_total_requests_total${module.filter-tags.query_alert} by {resource_group,region,name}, 1)
      , 0) * 100
      > ${var.requests_failed_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.requests_failed_threshold_critical
    warning  = var.requests_failed_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:virtualmachine", "team:claranet", "created-by:terraform"], var.requests_failed_extra_tags)
}
