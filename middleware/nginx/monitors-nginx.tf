data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_nginx:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "datadog_nginx_process" {
  name    = "[${var.environment}] Can't connect to nginx vhost status"
  message = "${coalesce(var.nginx_connect_message, var.message)}"

  type = "service check"

  query = <<EOF
    "nginx.can_connect".over(${data.template_file.filter.rendered}).by("host","port").last(6).count_by_status()
  EOF

  thresholds = {
    ok       = 1
    warning  = 2
    critical = 4
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.nginx_connect_silenced}"

  tags = ["env:${var.environment}", "resource:nginx"]
}
