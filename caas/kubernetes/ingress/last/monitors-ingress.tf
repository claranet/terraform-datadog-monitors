resource "datadog_monitor" "nginx_ingress_too_many_5xx" {
  count   = "${var.ingress_5xx_enabled ? 1 : 0}"
  name    = "[${var.environment}] Nginx Ingress 5xx errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.ingress_5xx_message, var.message)}"

  query = <<EOF
    ${var.ingress_5xx_time_aggregator}(${var.ingress_5xx_timeframe}): default( (
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-500.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) + 
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-501.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-502.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-503.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-504.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-505.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-506.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-507.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-508.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-509.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-510.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-511.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-520.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-521.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-522.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-523.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-524.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-525.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-526.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-527.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-530.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-598.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-599.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) ) /
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags.query_alert} by {ingress,namespace,controller_class}.as_rate()
      , 1) * 100 , 0 ) > ${var.ingress_5xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.ingress_5xx_threshold_warning}"
    critical = "${var.ingress_5xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.ingress_5xx_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:prometheus", "resource:nginx-ingress-controller", "team:claranet", "created-by:terraform", "${var.ingress_5xx_extra_tags}"]
}

resource "datadog_monitor" "nginx_ingress_too_many_4xx" {
  count   = "${var.ingress_4xx_enabled ? 1 : 0}"
  name    = "[${var.environment}] Nginx Ingress 4xx errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.ingress_4xx_message, var.message)}"

  query = <<EOF
    ${var.ingress_4xx_time_aggregator}(${var.ingress_4xx_timeframe}): default( (
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-400.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-401.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-402.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-403.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-404.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-405.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-406.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-407.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-408.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-409.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-410.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-411.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-412.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-413.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-414.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-415.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-416.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-417.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-418.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-419.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-420.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-421.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-422.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-423.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-424.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-425.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-426.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-427.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-428.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-429.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-430.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-431.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-440.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-444.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-449.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-450.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-451.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-494.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-495.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-496.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-497.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-498.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-499.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) ) /
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags.query_alert} by {ingress,namespace,controller_class}.as_rate()
      , 1) * 100 , 0 ) > ${var.ingress_4xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.ingress_4xx_threshold_warning}"
    critical = "${var.ingress_4xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.ingress_4xx_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:prometheus", "resource:nginx-ingress-controller", "team:claranet", "created-by:terraform", "${var.ingress_4xx_extra_tags}"]
}
