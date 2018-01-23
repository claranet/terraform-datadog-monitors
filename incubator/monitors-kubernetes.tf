resource "datadog_monitor" "kubernetes_cluster_cpu" {
  name    = "Kubernetes cluster CPU High > 85%"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  query   = "avg(last_5m):avg:system.cpu.system{*} by {cluster-name} + avg:system.cpu.user{*} by {cluster-name} > 85"

  thresholds {
    warning  = 75
    critical = 85
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

resource "datadog_monitor" "kubernetes_kubelet_check" {
  name    = "Kubernetes kubelet check down"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  query   = "\"kubernetes.kubelet.check\".over(\"goog-gke-node\").by(\"*\").last(1).pct_by_status()"

  thresholds {
    warning  = 0
    critical = 10
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

resource "datadog_monitor" "kubernetes_kubelet_ping" {
  name    = "Kubernetes kubelet ping not ok"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"

  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  query   = "\"kubernetes.kubelet.check.ping\".over(\"goog-gke-node\").by(\"*\").last(1).pct_by_status()"

  thresholds {
    warning  = 0
    critical = 10
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

resource "datadog_monitor" "kubernetes_pods_unavailable" {
  name    = "Kubernetes pods unavailable"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  query   = "max(last_5m):avg:kubernetes_state.deployment.replicas_desired{!namespace:cronetes} by {cluster-name,namespace,deployment} - avg:kubernetes_state.deployment.replicas_unavailable{!namespace:cronetes} by {cluster-name,namespace,deployment} + 1 < 1"
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

resource "datadog_monitor" "kubernetes_node_status" {
  name    = "Kubernetes node status"
  message = "{{#is_alert}}\n${var.alert_HNO} \n{{/is_alert}} \n{{#is_recovery}}\n${var.alert_HNO}\n{{/is_recovery}}\n{{#is_warning}}\n${var.warning_HO} \n{{/is_warning}} \n{{#is_warning_recovery}}\n${var.warning_HO}\n{{/is_warning_recovery}}"
  query   = "max(last_5m):avg:kubernetes_state.node.status{!namespace:cronetes} by {cluster-name,namespace,deployment} <= 0"
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

/*  type  = "query alert"

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
}*/

