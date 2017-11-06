resource "datadog_monitor" "datadog_gcp_lb_request_count" {
  name    = "GCP LoadBalancer request count changed too fast"
  message = ""
  query   = "change(sum(last_5m),last_30m):avg:gcp.loadbalancing.http.request_count{*} by {backend_name}.as_count() >= 300"
  type    = "query alert"

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

resource "datadog_monitor" "datadog_gcp_lb_500" {
  name    = "GCP LoadBalancer 500 ratio > 5%"
  message = ""
  query   = "sum(last_10m):avg:gcp.loadbalancing.http.request_count{response_code_class:500} by {backend_name}.as_count() / avg:gcp.loadbalancing.http.request_count{*} by {backend_name}.as_count() > 0.2"
  type    = "query alert"

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

resource "datadog_monitor" "datadog_gcp_lb_backend_latency" {
  name    = "GCP LB backend latency > 2s"
  message = ""
  query   = "min(last_5m):avg:gcp.loadbalancing.http.backend_latencies.avg{*} by {backend_name} > 2000"
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

resource "datadog_monitor" "datadog_gcp_lb_latency" {
  name    = "GCP LB latency > 5s"
  message = ""
  query   = "avg(last_5m):avg:gcp.loadbalancing.http.total_latencies.avg{*} > 5000"
  type    = "query alert"

  thresholds {
    warning  = 3000
    critical = 5000
  }

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
