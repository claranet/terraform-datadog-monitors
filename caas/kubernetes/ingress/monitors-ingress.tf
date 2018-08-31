resource "datadog_monitor" "Nginx_ingress_too_many_5xx" {
  count   = "${var.ingress_5xx_enabled ? 1 : 0}"
  name    = "[${var.environment}] Nginx Ingress 5xx errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.ingress_5xx_message, var.message)}"

  query = <<EOF
    sum(${var.ingress_5xx_timeframe}): (
      default(
        avg:nginx_ingress.nginx_upstream_responses_total${module.filter-tags-5xx.query_alert} by {upstream,ingress_class} /
        (avg:nginx_ingress.nginx_upstream_requests_total${module.filter-tags.query_alert} by {upstream,ingress_class} + ${var.artificial_requests_count}),
      0) * 100
    ) > ${var.ingress_5xx_threshold_critical}
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
