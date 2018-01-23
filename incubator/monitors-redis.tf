resource "datadog_monitor" "redis_connection" {
  name    = "Redis connection is down (Datadog check)"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "\"redis.can_connect\".over(\"app:redis\").by(\"*\").last(1).pct_by_status()"

  thresholds {
    critical = 50
    warning  = 5
  }

  type                = "service check"
  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "redis_eviction" {
  name    = "Redis eviction > 0"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "min(last_5m):avg:redis.keys.evicted{*} > 0"
  type    = "metric alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_blocked_client" {
  name    = "Redis blocked clients > 0"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "min(last_5m):avg:redis.clients.blocked{*} > 0"
  type    = "metric alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}

resource "datadog_monitor" "redis_swap" {
  name    = "Redis begin to swap"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "avg(last_5m):avg:redis.mem.fragmentation_ratio{*} <= 0.8"
  type    = "metric alert"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = false
  renotify_interval   = 0
  no_data_timeframe   = 20
}
