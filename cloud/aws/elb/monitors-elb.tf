data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_elb:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "ELB_no_healthy_instances" {
  name    = "[${var.environment}] ELB no healthy instances on {{host.identifier}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.healthy_host_count{${data.template_file.filter.rendered}} by {loadbalancername,region}
    ) == 0
  EOF

  type = "metric alert"

  notify_no_data      = "${var.elb_notify_no_data}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_unhealthy_instances" {
  name    = "[${var.environment}] ELB some unhealthy instances on {{host.identifier}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.un_healthy_host_count{${data.template_file.filter.rendered}} by {loadbalancername,region}
    ) > 0"
  EOF

  type = "metric alert"

  notify_no_data      = "${var.elb_notify_no_data}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_too_much_5xx_backend" {
  name    = "[${var.environment}] ELB too much 5xx backend err on {{host.identifier}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.httpcode_backend_5xx{${data.template_file.filter.rendered}} by {loadbalancername,region} /
      avg:aws.elb.request_count{${data.template_file.filter.rendered}} by {loadbalancername,region}
    ) * 100 > ${var.elb_5xx_threshold_critical}"
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_5xx_threshold_warning}"
    critical = "${var.elb_5xx_threshold_critical}"
  }

  notify_no_data      = "${var.elb_notify_no_data}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_too_much_4xx_backend" {
  name    = "[${var.environment}] ELB too much 4xx backend err on {{host.identifier}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.httpcode_backend_4xx{${data.template_file.filter.rendered}} by {loadbalancername,region} /
      avg:aws.elb.request_count{${data.template_file.filter.rendered}} by {loadbalancername,region}
    ) * 100 > ${var.elb_4xx_threshold_critical}"
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_4xx_threshold_warning}"
    critical = "${var.elb_4xx_threshold_critical}"
  }

  notify_no_data      = "${var.elb_notify_no_data}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_backend_latency" {
  name    = "[${var.environment}] ELB latency to high on  {{host.identifier}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.latency{${data.template_file.filter.rendered}} by {loadbalancername,region}
    ) > ${var.elb_backend_latency_critical}}"
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_latency_warning}"
    critical = "${var.elb_backend_latency_critical}"
  }

  notify_no_data      = "${var.elb_notify_no_data}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}
