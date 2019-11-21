# Monitoring App Gateway status
resource "datadog_monitor" "appgateway_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway is down"
  message = coalesce(var.status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}): (
       avg:azure.network_applicationgateways.status${module.filter-tags.query_alert} by {resource_group,region,name}
    ) != 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.status_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway current_connections
resource "datadog_monitor" "current_connection" {
  count   = var.current_connection_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway has no connection"
  message = coalesce(var.current_connection_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.current_connection_time_aggregator}(${var.current_connection_timeframe}):
    azure.network_applicationgateways.current_connections${module.filter-tags.query_alert} by {resource_group,region,name} < 1
EOQ

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.current_connection_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway backend_connect_time
resource "datadog_monitor" "appgateway_backend_connect_time" {
  count   = var.appgateway_backend_connect_time_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway backend connect time is too high {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.appgateway_backend_connect_time_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_backend_connect_time_time_aggregator}(${var.appgateway_backend_connect_time_timeframe}):
      sum:azure.network_applicationgateways.backend_connect_time${module.filter-tags.query_alert} by {resource_group,region,name,backendhttpsetting,backendpool,backendserver} > ${var.appgateway_backend_connect_time_threshold_critical}
EOQ

  thresholds = {
    critical = var.appgateway_backend_connect_time_threshold_critical
    warning  = var.appgateway_backend_connect_time_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_backend_connect_time_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway failed_requests
resource "datadog_monitor" "appgateway_failed_requests" {
  count   = var.appgateway_failed_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway failed requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.appgateway_failed_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_failed_requests_time_aggregator}(${var.appgateway_failed_requests_timeframe}):
      default((default(avg:azure.network_applicationgateways.failed_requests${module.filter-tags.query_alert} by {resource_group,region,name,backendsettingspool}.as_rate(), 0) /
      default(avg:azure.network_applicationgateways.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,backendsettingspool}.as_rate(),0)
      * 100),0) > ${var.appgateway_failed_requests_threshold_critical}
EOQ

  thresholds = {
    critical = var.appgateway_failed_requests_threshold_critical
    warning  = var.appgateway_failed_requests_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_failed_requests_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway unhealthy_host_ratio
resource "datadog_monitor" "appgateway_healthy_host_ratio" {
  count   = var.appgateway_unhealthy_host_ratio_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway backend unhealthy host ratio is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.appgateway_unhealthy_host_ratio_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_unhealthy_host_ratio_time_aggregator}(${var.appgateway_unhealthy_host_ratio_timeframe}):
      sum:azure.network_applicationgateways.unhealthy_host_count${module.filter-tags.query_alert} by {resource_group,region,name,backendsettingspool} /
      (sum:azure.network_applicationgateways.unhealthy_host_count${module.filter-tags.query_alert} by {resource_group,region,name,backendsettingspool} +
       sum:azure.network_applicationgateways.healthy_host_count${module.filter-tags.query_alert} by {resource_group,region,name,backendsettingspool})
      * 100 > ${var.appgateway_unhealthy_host_ratio_threshold_critical}
EOQ

  thresholds = {
    critical = var.appgateway_unhealthy_host_ratio_threshold_critical
    warning  = var.appgateway_unhealthy_host_ratio_threshold_warning
  }
  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_unhealthy_host_ratio_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway response_status 4xx
resource "datadog_monitor" "appgateway_http_4xx_errors" {
  count   = var.appgateway_http_4xx_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway HTTP 4xx errors rate is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.appgateway_http_4xx_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_http_4xx_errors_time_aggregator}(${var.appgateway_http_4xx_errors_timeframe}):
      default((default(sum:azure.network_applicationgateways.response_status${module.filter-tags-4xx-error.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(sum:azure.network_applicationgateways.response_status${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(),0)
      * 100),0) > ${var.appgateway_http_4xx_errors_threshold_critical}
EOQ


  thresholds = {
    warning  = var.appgateway_http_4xx_errors_threshold_warning
    critical = var.appgateway_http_4xx_errors_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_http_4xx_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway response_status 5xx
resource "datadog_monitor" "appgateway_http_5xx_errors" {
  count   = var.appgateway_http_5xx_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway HTTP 5xx errors rate is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.appgateway_http_5xx_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_http_5xx_errors_time_aggregator}(${var.appgateway_http_5xx_errors_timeframe}):
      default((default(sum:azure.network_applicationgateways.response_status${module.filter-tags-5xx-error.query_alert} by {resource_group,region,name}.as_rate(), 0) /
      default(sum:azure.network_applicationgateways.response_status${module.filter-tags.query_alert} by {resource_group,region,name}.as_rate(),0)
      * 100),0) > ${var.appgateway_http_5xx_errors_threshold_critical}
EOQ

  thresholds = {
    warning  = var.appgateway_http_5xx_errors_threshold_warning
    critical = var.appgateway_http_5xx_errors_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_http_5xx_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway Backend response_status 4xx
resource "datadog_monitor" "appgateway_backend_http_4xx_errors" {
  count   = var.appgateway_backend_http_4xx_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway backend HTTP 4xx errors rate is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.appgateway_backend_http_4xx_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_backend_http_4xx_errors_time_aggregator}(${var.appgateway_backend_http_4xx_errors_timeframe}):
      default((default(sum:azure.network_applicationgateways.backend_response_status${module.filter-tags-backend-4xx-error.query_alert} by {resource_group,region,name,backendhttpsetting,backendpool,backendserver}.as_rate(), 0) /
      default(sum:azure.network_applicationgateways.backend_response_status${module.filter-tags.query_alert} by {resource_group,region,name,backendhttpsetting,backendpool,backendserver}.as_rate(),0)
      * 100),0) > ${var.appgateway_backend_http_4xx_errors_threshold_critical}
EOQ


  thresholds = {
    warning  = var.appgateway_backend_http_4xx_errors_threshold_warning
    critical = var.appgateway_backend_http_4xx_errors_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_backend_http_4xx_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

# Monitoring App Gateway Backend response_status 5xx
resource "datadog_monitor" "appgateway_backend_http_5xx_errors" {
  count   = var.appgateway_backend_http_5xx_errors_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] App Gateway backend HTTP 5xx errors rate is too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.appgateway_backend_http_5xx_errors_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.appgateway_backend_http_5xx_errors_time_aggregator}(${var.appgateway_backend_http_5xx_errors_timeframe}):
      default((default(sum:azure.network_applicationgateways.backend_response_status${module.filter-tags-backend-5xx-error.query_alert} by {resource_group,region,name,backendhttpsetting,backendpool,backendserver}.as_rate(), 0) /
      default(sum:azure.network_applicationgateways.backend_response_status${module.filter-tags.query_alert} by {resource_group,region,name,backendhttpsetting,backendpool,backendserver}.as_rate(),0)
      * 100),0) > ${var.appgateway_backend_http_5xx_errors_threshold_critical}
EOQ

  thresholds = {
    warning  = var.appgateway_backend_http_5xx_errors_threshold_warning
    critical = var.appgateway_backend_http_5xx_errors_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 1
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:app-gateway", "team:claranet", "created-by:terraform"], var.appgateway_backend_http_5xx_errors_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}
