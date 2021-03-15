#
# TLS Cannot Connect
#
resource "datadog_monitor" "cannot_connect" {
  count   = var.cannot_connect_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] TLS cannot connect"
  message = coalesce(var.cannot_connect_message, var.message)
  type    = "service check"

  query = <<EOQ
    "tls.can_connect"${module.filter-tags.service_check}.by("name","server","port","server_hostname").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.cannot_connect_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  no_data_timeframe   = var.cannot_connect_no_data_timeframe
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:network", "provider:tls", "resource:webcheck", "team:claranet", "created-by:terraform"], var.cannot_connect_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Invalid TLS Certificate
#
resource "datadog_monitor" "invalid_tls_certificate" {
  count   = var.invalid_tls_certificate_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] TLS invalid certificate"
  message = coalesce(var.invalid_tls_certificate_message, var.message)
  type    = "service check"

  query = <<EOQ
    "tls.cert_validation"${module.filter-tags.service_check}.by("name","server","port","server_hostname").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.invalid_tls_certificate_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:network", "provider:tls", "resource:tls-certificate", "team:claranet", "created-by:terraform"], var.invalid_tls_certificate_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# TLS Certificate Expiration
#
resource "datadog_monitor" "tls_certificate_expiration" {
  count   = var.tls_certificate_expiration_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] TLS certificate expiring"
  message = coalesce(var.tls_certificate_expiration_message, var.message)
  type    = "service check"

  query = <<EOQ
    "tls.cert_expiration"${module.filter-tags.service_check}.by("name","server","port","server_hostname").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.tls_certificate_expiration_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:network", "provider:tls", "resource:tls-certificate", "team:claranet", "created-by:terraform"], var.tls_certificate_expiration_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

#
# Certificate Expiration Date
#
resource "datadog_monitor" "certificate_expiration_date" {
  count   = var.certificate_expiration_date_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] TLS certificate expiration {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}} days){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}} days){{/is_warning}}"
  message = var.certificate_expiration_date_message
  type    = "query alert"

  query = <<EOQ
    ${var.certificate_expiration_date_time_aggregator}(${var.certificate_expiration_date_timeframe}):
      avg:tls.days_left${module.filter-tags.query_alert} by {name,server,port,server_hostname}
    < ${var.certificate_expiration_date_threshold_critical}
EOQ


  monitor_thresholds {
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

  tags = concat(["env:${var.environment}", "type:network", "provider:tls", "resource:tls-certificate", "team:claranet", "created-by:terraform"], var.certificate_expiration_date_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}