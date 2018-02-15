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
    avg(last_5m):avg:azure.cache_redis.status{${data.template_file.filter.rendered}} by {resource_group,region,name} != 1
EOF

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "evictedkeys" {
  name    = "[${var.environment}] Redis too many evictedkeys {{comparator}} {{#is_alert}}{{threshold}}{{/is_alert}}{{#is_warning}}{{warn_threshold}}{{/is_warning}} ({{value}})"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.cache_redis.evictedkeys{${data.template_file.filter.rendered}} by {resource_group,region,name}
     ) > ${var.evictedkeys_limit_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.evictedkeys_limit_threshold_warning}"
    critical = "${var.evictedkeys_limit_threshold_critical}"
  }

  silenced = "${var.evictedkeys_limit_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "percent_processor_time" {
  name    = "[${var.environment}] Redis processor time too high {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.cache_redis.percent_processor_time{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.percent_processor_time_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.percent_processor_time_threshold_warning}"
    critical = "${var.percent_processor_time_threshold_critical}"
  }

  silenced = "${var.percent_processor_time_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "server_load" {
  name    = "[${var.environment}] Redis server load too high {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:azure.cache_redis.server_load{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.server_load_rate_threshold_critical}
EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.server_load_rate_threshold_warning}"
    critical = "${var.server_load_rate_threshold_critical}"
  }

  silenced = "${var.server_load_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:redis", "team:azure", "provider:azure"]
}
