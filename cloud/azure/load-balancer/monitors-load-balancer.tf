resource "datadog_monitor" "loadbalancer_status" {
  count = "${var.status_enabled ? 1 : 0}"

  name    = "[${var.environment}] Load Balancer is unreachable"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
      ${var.status_time_aggregator}(${var.status_timeframe}): (
        avg:azure.network_loadbalancers.status${module.filter-tags.query_alert} by {resource_group,region,name}
      ) < 1
  EOF

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

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:load-balancer", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}
