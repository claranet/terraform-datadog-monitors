data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_servicebus:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "servicebus_status" {
  name    = "[${var.environment}] Service Bus is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
      ${var.status_aggregator}(${var.status_timeframe}): (
        ${var.status_aggregator}:azure.servicebus_namespaces.status{${data.template_file.filter.rendered}} by {resource_group,region,name}
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

  tags = ["env:${var.environment}", "resource:servicebus", "team:azure", "provider:azure"]
}
