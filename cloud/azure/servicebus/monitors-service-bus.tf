resource "datadog_monitor" "servicebus_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Service Bus is down"
  message = coalesce(var.status_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.status_time_aggregator}(${var.status_timeframe}): (
        avg:azure.servicebus_namespaces.count${module.filter-tags-status.query_alert} by {resource_group,region,name}
      ) != 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.servicebus_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:servicebus", "team:claranet", "created-by:terraform"], var.status_extra_tags)
}

resource "datadog_monitor" "service_bus_no_active_connections" {
  count   = var.no_active_connections_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Service Bus has no active connection"
  message = coalesce(var.no_active_connections_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.no_active_connections_time_aggregator}(${var.no_active_connections_timeframe}): (
      avg:azure.servicebus_namespaces.active_connections_preview${module.filter-tags.query_alert} by {resource_group,region,name}
      ) < 1
EOQ

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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:servicebus", "team:claranet", "created-by:terraform"], var.no_active_connections_extra_tags)
}

resource "datadog_monitor" "service_bus_user_errors" {
  count   = var.user_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Service Bus user errors rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.user_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.user_errors_time_aggregator}(${var.user_errors_timeframe}): (
        default(avg:azure.servicebus_namespaces.user_errors.preview${module.filter-tags.query_alert} by {resource_group,region,name,entityname}, 0) /
        default(avg:azure.servicebus_namespaces.incoming_requests_preview${module.filter-tags.query_alert} by {resource_group,region,name,entityname}, 1)
      ) * 100 > ${var.user_errors_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.user_errors_threshold_critical
    warning  = var.user_errors_threshold_warning
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:servicebus", "team:claranet", "created-by:terraform"], var.user_errors_extra_tags)
}

resource "datadog_monitor" "service_bus_server_errors" {
  count   = var.server_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Service Bus server errors rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.server_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
      ${var.server_errors_time_aggregator}(${var.server_errors_timeframe}): (
        default(avg:azure.servicebus_namespaces.server_errors.preview${module.filter-tags.query_alert} by {resource_group,region,name,entityname}, 0) /
        default(avg:azure.servicebus_namespaces.incoming_requests_preview${module.filter-tags.query_alert} by {resource_group,region,name,entityname}, 1)
      ) * 100 > ${var.server_errors_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.server_errors_threshold_critical
    warning  = var.server_errors_threshold_warning
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

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:servicebus", "team:claranet", "created-by:terraform"], var.server_errors_extra_tags)
}

