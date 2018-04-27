data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_storage:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "availability" {
  name    = "[${var.environment}] Azure Storage is down"
  message = "${coalesce(var.availability_message, var.message)}"

  query = <<EOF
    ${var.availability_aggregator}(${var.availability_timeframe}): (default(
      ${var.availability_aggregator}:azure.storage.availability{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    100)) < ${var.availability_threshold_critical}
EOF

  thresholds {
    critical = "${var.availability_threshold_critical}"
    warning  = "${var.availability_threshold_warning}"
  }

  silenced = "${var.availability_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "successful_requests" {
  name    = "[${var.environment}] Azure Storage too few successful requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.successful_requests_message, var.message)}"

  query = <<EOF
    ${var.successful_requests_aggregator}(${var.successful_requests_timeframe}): (default(
      ${var.successful_requests_aggregator}:azure.storage.percent_success{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    100)) < ${var.successful_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.successful_requests_threshold_critical}"
    warning  = "${var.successful_requests_threshold_warning}"
  }

  silenced = "${var.successful_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "latency" {
  name    = "[${var.environment}] Azure Storage too high end to end latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOF
    ${var.latency_aggregator}(${var.latency_timeframe}): (default(
      ${var.latency_aggregator}:azure.storage.average_e2_e_latency{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.latency_threshold_critical}
EOF

  thresholds {
    critical = "${var.latency_threshold_critical}"
    warning  = "${var.latency_threshold_warning}"
  }

  silenced = "${var.latency_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "timeout_error_requests" {
  name    = "[${var.environment}] Azure Storage too many timeout errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.timeout_error_requests_message, var.message)}"

  query = <<EOF
    ${var.timeout_error_requests_aggregator}(${var.timeout_error_requests_timeframe}): (default(
      ${var.timeout_error_requests_aggregator}:azure.storage.percent_timeout_error{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.timeout_error_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.timeout_error_requests_threshold_critical}"
    warning  = "${var.timeout_error_requests_threshold_warning}"
  }

  silenced = "${var.timeout_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "network_error_requests" {
  name    = "[${var.environment}] Azure Storage too many network errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_error_requests_message, var.message)}"

  query = <<EOF
    ${var.network_error_requests_aggregator}(${var.network_error_requests_timeframe}): (default(
      ${var.network_error_requests_aggregator}:azure.storage.percent_network_error{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.network_error_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.network_error_requests_threshold_critical}"
    warning  = "${var.network_error_requests_threshold_warning}"
  }

  silenced = "${var.network_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "throttling_error_requests" {
  name    = "[${var.environment}] Azure Storage too many throttling errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.throttling_error_requests_message, var.message)}"

  query = <<EOF
    ${var.throttling_error_requests_aggregator}(${var.throttling_error_requests_timeframe}): (default(
      ${var.throttling_error_requests_aggregator}:azure.storage.percent_throttling_error{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.throttling_error_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.throttling_error_requests_threshold_critical}"
    warning  = "${var.throttling_error_requests_threshold_warning}"
  }

  silenced = "${var.throttling_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "server_other_error_requests" {
  name    = "[${var.environment}] Azure Storage too many server_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.server_other_error_requests_message, var.message)}"

  query = <<EOF
    ${var.server_other_error_requests_aggregator}(${var.server_other_error_requests_timeframe}): (default(
      ${var.server_other_error_requests_aggregator}:azure.storage.percent_server_other_error{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.server_other_error_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.server_other_error_requests_threshold_critical}"
    warning  = "${var.server_other_error_requests_threshold_warning}"
  }

  silenced = "${var.server_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "client_other_error_requests" {
  name    = "[${var.environment}] Azure Storage too many client_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.client_other_error_requests_message, var.message)}"

  query = <<EOF
    ${var.client_other_error_requests_aggregator}(${var.client_other_error_requests_timeframe}): (default(
      ${var.client_other_error_requests_aggregator}:azure.storage.percent_client_other_error{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.client_other_error_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.client_other_error_requests_threshold_critical}"
    warning  = "${var.client_other_error_requests_threshold_warning}"
  }

  silenced = "${var.client_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "authorization_error_requests" {
  name    = "[${var.environment}] Azure Storage too many authorization errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.authorization_error_requests_message, var.message)}"

  query = <<EOF
    ${var.authorization_error_requests_aggregator}(${var.authorization_error_requests_timeframe}): (default(
      ${var.authorization_error_requests_aggregator}:azure.storage.percent_authorization_error{${data.template_file.filter.rendered},transaction_type:all} by {resource_group,storage_type,name},
    0)) > ${var.authorization_error_requests_threshold_critical}
EOF

  thresholds {
    critical = "${var.authorization_error_requests_threshold_critical}"
    warning  = "${var.authorization_error_requests_threshold_warning}"
  }

  silenced = "${var.authorization_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "resource:storage", "team:azure", "provider:azure"]
}
