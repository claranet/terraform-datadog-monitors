resource "datadog_monitor" "datadog_apache_process" {
  count   = "${var.apache_connect_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Apache vhost status does not respond"
  message = "${coalesce(var.apache_connect_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "apache.can_connect"${module.filter-tags.service_check}.by("port","server").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.apache_connect_threshold_warning}"
    critical = 5
  }

  notify_no_data      = true
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.apache_connect_silenced}"

  tags = ["env:${var.environment}", "type:middleware", "provider:apache", "resource:apache", "team:claranet", "created-by:terraform", "${var.apache_connect_extra_tags}"]
}
