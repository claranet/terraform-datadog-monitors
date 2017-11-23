data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_default == "true" ? format("dd_monitoring:enabled,dd_azure_storage:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "availability" {
  name    = "[${var.environment}] Azure Storage {{name}} unvailability detected"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.availability{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) < ${var.availability_threshold_critical}
EOF

  thresholds {
    critical  = "${var.availability_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}

resource "datadog_monitor" "successful_requests" {
  name    = "[${var.environment}] Azure Storage {{name}} too much failed requests"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_success{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) < ${var.successful_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.successful_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}

resource "datadog_monitor" "latency" {
  name    = "[${var.environment}] Azure Storage {{name}} too high end to end latency"
  message = "${var.message}"

  query = <<EOF
    max(last_5m): (
      avg:azure.storage.average_e2_e_latency{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.latency_threshold_critical}
EOF

  thresholds {
    critical  = "${var.latency_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}

resource "datadog_monitor" "timeout_error_requests" {
  name    = "[${var.environment}] Azure Storage {{value}}% of timeout error requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_timeout_error{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.timeout_error_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.timeout_error_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}


resource "datadog_monitor" "network_error_requests" {
  name    = "[${var.environment}] Azure Storage {{value}}% of network error requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_network_error{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.network_error_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.network_error_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}


resource "datadog_monitor" "throttling_error_requests" {
  name    = "[${var.environment}] Azure Storage {{value}}% of throttling error requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_throttling_error{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.throttling_error_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.throttling_error_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}


resource "datadog_monitor" "server_other_error_requests" {
  name    = "[${var.environment}] Azure Storage {{value}}% of server_other error requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_server_other_error{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.server_other_error_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.server_other_error_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}


resource "datadog_monitor" "client_other_error_requests" {
  name    = "[${var.environment}] Azure Storage {{value}}% of client_other error requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_client_other_error{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.client_other_error_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.client_other_error_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}


resource "datadog_monitor" "authorization_error_requests" {
  name    = "[${var.environment}] Azure Storage {{value}}% of authorization error requests on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.percent_authorization_error{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) > ${var.authorization_error_requests_threshold_critical}
EOF

  thresholds {
    critical  = "${var.authorization_error_requests_threshold_critical}"
  }

  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  no_data_timeframe   = 20

  tags = ["env:${var.environment}","resource:storage","team:azure", "provider:azure"]
}
