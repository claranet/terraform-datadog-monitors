### Beanstalk environment health ###
resource "datadog_monitor" "health" {
  count   = var.health_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Beanstalk Environment health {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}} : either degraded or severe){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}} : warning){{/is_warning}}"
  message = coalesce(var.health_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.health_time_aggregator}(${var.health_timeframe}):min:aws.elasticbeanstalk.environment_health${module.filter-tags.query_alert} by {region,elasticbeanstalk_environment-name} >= ${var.health_threshold_critical}
EOQ

  thresholds = {
    critical = var.health_threshold_critical
    warning  = var.health_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.health_no_data_timeframe
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:beanstalk", "team:claranet", "created-by:terraform"], var.health_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "application_latency_p90" {
  count   = var.application_latency_p90_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Beanstalk Application latency p90 {{#is_alert}}{{{comparator}}} {{threshold}}sec ({{value}}sec){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}sec ({{value}}sec){{/is_warning}}"
  message = coalesce(var.application_latency_p90_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.application_latency_p90_time_aggregator}(${var.application_latency_p90_timeframe}):min:aws.elasticbeanstalk.application_latency_p_9_0${module.filter-tags-no-host.query_alert} by {region,elasticbeanstalk_environment-name} >= ${var.application_latency_p90_threshold_critical}
EOQ

  thresholds = {
    critical = var.application_latency_p90_threshold_critical
    warning  = var.application_latency_p90_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:beanstalk", "team:claranet", "created-by:terraform"], var.application_latency_p90_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "application_5xx_error_rate" {
  count   = var.application_5xx_error_rate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Beanstalk Application 5xx error rate {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.application_5xx_error_rate_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.application_5xx_error_rate_time_aggregator}(${var.application_5xx_error_rate_timeframe}):sum:aws.elasticbeanstalk.application_requests_5xx${module.filter-tags-no-host.query_alert} by {region,elasticbeanstalk_environment-name}.as_rate() / sum:aws.elasticbeanstalk.application_requests_total${module.filter-tags-no-host.query_alert} by {region,elasticbeanstalk_environment-name}.as_rate() * 100 > ${var.application_5xx_error_rate_threshold_critical}
EOQ

  thresholds = {
    critical = var.application_5xx_error_rate_threshold_critical
    warning  = var.application_5xx_error_rate_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:beanstalk", "team:claranet", "created-by:terraform"], var.application_5xx_error_rate_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "root_filesystem_usage" {
  count   = var.root_filesystem_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Beanstalk Instance root file system usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.root_filesystem_usage_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.root_filesystem_usage_aggregator}(${var.root_filesystem_usage_timeframe}):min:aws.elasticbeanstalk.root_filesystem_util${module.filter-tags.query_alert} by {region,elasticbeanstalk_environment-name,host} > ${var.root_filesystem_usage_threshold_critical}
EOQ

  thresholds = {
    critical = var.root_filesystem_usage_threshold_critical
    warning  = var.root_filesystem_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = var.root_filesystem_usage_timeout_h
  include_tags        = true
  require_full_window = false
  locked              = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:beanstalk", "team:claranet", "created-by:terraform"], var.root_filesystem_usage_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

