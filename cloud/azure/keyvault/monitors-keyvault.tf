data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_servicebus:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "keyvault_status" {
  name    = "[${var.environment}] Key Vault is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
      ${var.status_time_aggregator}(${var.status_timeframe}): (
        avg:azure.keyvault_vaults.status{${data.template_file.filter.rendered}} by {resource_group,region,name}
      ) != 1
EOF

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:keyvault", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "keyvault_api_result" {
  name    = "[${var.environment}] Key Vault API result rate is low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
      sum(${var.api_result_timeframe}): (
        avg:azure.keyvault_vaults.service_api_result{${data.template_file.filter.rendered}} by {name,resource_group,region}.as_count() /
        avg:azure.keyvault_vaults.service_api_hit{${data.template_file.filter.rendered}} by {name,resource_group,region}.as_count()
      ) * 100 < ${var.api_result_threshold_critical}
  EOF

  thresholds {
    critical = "${var.api_result_threshold_critical}"
    warning  = "${var.api_result_threshold_warning}"
  }

  type = "metric alert"

  silenced = "${var.api_result_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:keyvault", "team:azure", "provider:azure"]
}
