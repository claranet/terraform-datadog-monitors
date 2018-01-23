resource "datadog_monitor" "kubernetes_redis_cpu_95_5min" {
  name = "Kubernetes Redis container CPU High > 95% for 5 min"

  #message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"
  query   = "avg(last_5m):avg:gcp.container.cpu.utilization{container_name:redis} by {cluster-name} * 100 > 95"

  thresholds {
    #    warning  = 80
    critical = 95
  }

  type                = "query alert"
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

resource "datadog_monitor" "kubernetes_redis_cpu_80_15min" {
  name = "Kubernetes Redis container CPU High > 80% for 15 min"

  #message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}"

  query = "min(last_15m):avg:gcp.container.cpu.utilization{container_name:redis} by {cluster-name} * 100 > 80"
  type  = "query alert"

  thresholds {
    #    warning  = 75
    critical = 80
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

# resource "datadog_monitor" "kubernetes_redis_oom" {
#   name    = "Kubernetes Redis container out of memory > 85%"
#   message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n${var.warning_HO}"
#   query = "avg(last_5m):avg:gcp.container.memory.bytes_used{container_name:redis} by {cluster-name} / avg:gcp.container.memory.bytes_total{container_name:redis} by {cluster-name} > 85"
#
#   thresholds {
#     warning  = 70
#     critical = 85
#   }
#
#   type                = "query alert"
#   notify_no_data      = false
#   renotify_interval   = 60
#   notify_audit        = false
#   timeout_h           = 0
#   include_tags        = true
#   locked              = false
#   require_full_window = true
#   new_host_delay      = 300
#   notify_no_data      = false
#   renotify_interval   = 0
#   no_data_timeframe   = 20
# }

