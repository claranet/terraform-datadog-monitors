data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_redis:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "status" {
  name    = "[${var.environment}] Redis {{name}} is down"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):avg:azure.cache_redis.status{${data.template_file.filter.rendered}} by {name,resource_group} != 1
EOF

  type = "metric alert"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "evictedkeys" {
  name    = "[${var.environment}] Redis {{value}} evictedkeys on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.cache_redis.evictedkeys{${data.template_file.filter.rendered}} by {name,resource_group}
     ) > ${var.evictedkeys_limit_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.evictedkeys_limit_threshold_warning}"
    critical = "${var.evictedkeys_limit_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "percent_processor_time" {
  name    = "[${var.environment}] Redis processor time {{value}}% on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.cache_redis.percent_processor_time{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.percent_processor_time_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.percent_processor_time_threshold_warning}"
    critical = "${var.percent_processor_time_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "server_load" {
  name    = "[${var.environment}] Redis processor server load {{value}}% on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.cache_redis.server_load{${data.template_file.filter.rendered}} by {name,resource_group}
    ) > ${var.server_load_rate_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.server_load_rate_threshold_warning}"
    critical = "${var.server_load_rate_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}
