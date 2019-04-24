resource "datadog_monitor" "keyvault_status" {
  count = "${var.status_enabled == "true" ? 1 : 0}"

  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Key Vault is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOQ
      ${var.status_time_aggregator}(${var.status_timeframe}): (
        avg:azure.keyvault_vaults.status${module.filter-tags.query_alert} by {resource_group,region,name}
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

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:keyvault", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "keyvault_api_result" {
  count = "${var.api_result_enabled == "true" ? 1 : 0}"

  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Key Vault API result rate is low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOQ
      ${var.api_result_time_aggregator}(${var.api_result_timeframe}):
      default(
        avg:azure.keyvault_vaults.service_api_result${format(module.filter-tags-statuscode.query_alert, "200")} by {name,resource_group,region}.as_rate() /
        avg:azure.keyvault_vaults.service_api_result${module.filter-tags.query_alert} by {name,resource_group,region}.as_rate()
        * 100
      , 100) < ${var.api_result_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.api_result_threshold_critical}"
    warning  = "${var.api_result_threshold_warning}"
  }

  type = "metric alert"

  silenced = "${var.api_result_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:keyvault", "team:claranet", "created-by:terraform", "${var.api_result_extra_tags}"]
}

resource "datadog_monitor" "keyvault_api_latency" {
  count = "${var.api_latency_enabled == "true" ? 1 : 0}"

  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Key Vault API latency is high {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOQ
      ${var.api_latency_time_aggregator}(${var.api_latency_timeframe}):
        avg:azure.keyvault_vaults.service_api_latency${module.filter-tags-activity.query_alert} by {name,resource_group,region}
        > ${var.api_latency_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.api_latency_threshold_critical}"
    warning  = "${var.api_latency_threshold_warning}"
  }

  type = "metric alert"

  silenced = "${var.api_latency_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:keyvault", "team:claranet", "created-by:terraform", "${var.api_latency_extra_tags}"]
}
