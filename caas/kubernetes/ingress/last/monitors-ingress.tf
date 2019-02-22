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
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-512.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-513.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-514.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-515.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-516.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-517.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-518.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-519.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-520.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-521.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-522.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-523.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-524.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-525.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-526.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-527.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-528.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-529.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-530.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-531.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-532.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-533.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-534.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-535.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-536.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-537.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-538.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-539.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-540.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-541.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-542.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-543.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-544.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-545.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-546.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-547.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-548.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-549.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-550.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-551.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-552.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-553.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-554.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-555.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-556.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-557.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-558.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-559.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-560.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-561.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-562.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-563.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-564.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-565.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-566.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-567.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-568.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-569.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-570.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-571.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-572.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-573.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-574.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-575.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-576.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-577.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-578.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-579.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-580.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-581.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-582.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-583.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-584.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-585.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-586.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-587.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-588.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-589.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-590.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-591.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-592.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-593.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-594.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-595.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-596.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-597.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
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
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-432.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-433.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-434.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-435.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-436.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-437.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-438.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-439.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-440.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-441.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-442.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-443.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-444.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-445.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-446.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-447.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-448.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-449.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-450.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-451.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-452.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-453.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-454.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-455.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-456.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-457.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-458.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-459.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-460.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-461.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-462.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-463.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-464.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-465.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-466.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-467.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-468.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-469.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-470.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-471.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-472.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-473.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-474.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-475.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-476.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-477.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-478.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-479.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-480.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-481.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-482.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-483.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-484.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-485.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-486.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-487.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-488.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-489.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-490.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-491.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-492.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-493.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-494.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-495.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-496.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-497.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-498.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
      default(sum:nginx_ingress.nginx_ingress_controller_requests${module.filter-tags-499.query_alert} by {ingress,namespace,controller_class}.as_rate(), 0) +
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
