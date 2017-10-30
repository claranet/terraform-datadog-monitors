resource "datadog_monitor" "status" {
  name    = "[${var.environment}] Redis {{name}} is down"
  message = "${var.message}"

  query = "avg(last_5m):avg:azure.cache_redis.status{*} by {name,resource_group} != 1"
  type  = "query alert"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "evictedkeys" {
  name    = "[${var.environment}] Redis {{value}} evictedkeys on {{name}}"
  message = "${var.message}"

  query = "avg(last_5m):avg:azure.cache_redis.evictedkeys{*} by {name,resource_group} > ${var.evictedkeys_threshold_critical}"
  type  = "query alert"

  thresholds {
    warning  = "${var.evictedkeys_threshold_warning}"
    critical = "${var.evictedkeys_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}
