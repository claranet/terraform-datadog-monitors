#
# Invalid SSL Certificate
#
resource "datadog_monitor" "invalid_ssl_certificate" {
  count   = var.invalid_ssl_certificate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SSL invalid certificate"
  message = coalesce(var.invalid_ssl_certificate_message, var.message)
  type    = "service check"

  query = <<EOQ
    "http.ssl_cert"${module.filter-tags.service_check}.by("instance","url").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.invalid_ssl_certificate_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.invalid_ssl_certificate_no_data_timeframe
  notify_no_data      = true
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:network", "provider:http_check", "resource:ssl-certificate", "team:claranet", "created-by:terraform"], var.invalid_ssl_certificate_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}

#
# Certificate Expiration Date
#
resource "datadog_monitor" "certificate_expiration_date" {
  count   = var.certificate_expiration_date_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SSL certificate expiration {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}} days){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}} days){{/is_warning}}"
  message = coalesce(var.certificate_expiration_date_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.certificate_expiration_date_time_aggregator}(${var.certificate_expiration_date_timeframe}):
      avg:http.ssl.days_left${module.filter-tags.query_alert} by {url}
    < ${var.certificate_expiration_date_threshold_critical}
EOQ

  thresholds = {
    warning  = var.certificate_expiration_date_threshold_warning
    critical = var.certificate_expiration_date_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:network", "provider:http_check", "resource:ssl-certificate", "team:claranet", "created-by:terraform"], var.certificate_expiration_date_extra_tags)

  lifecycle {
    ignore_changes = ["silenced"]
  }
}