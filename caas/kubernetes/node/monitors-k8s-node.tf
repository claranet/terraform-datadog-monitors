resource "datadog_monitor" "disk_pressure" {
  count   = var.disk_pressure_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node Disk pressure"
  message = coalesce(var.disk_pressure_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes_state.node.disk_pressure"${module.filter-tags.service_check}.by("node").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.disk_pressure_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.disk_pressure_extra_tags)
}

resource "datadog_monitor" "disk_out" {
  count   = var.disk_out_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node Out of disk"
  message = coalesce(var.disk_out_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes_state.node.out_of_disk"${module.filter-tags.service_check}.by("node").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.disk_out_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.disk_out_extra_tags)
}

resource "datadog_monitor" "memory_pressure" {
  count   = var.memory_pressure_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node Memory pressure"
  message = coalesce(var.memory_pressure_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes_state.node.memory_pressure"${module.filter-tags.service_check}.by("node").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.memory_pressure_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.memory_pressure_extra_tags)
}

resource "datadog_monitor" "ready" {
  count   = var.ready_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node not ready"
  message = coalesce(var.ready_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes_state.node.ready"${module.filter-tags.service_check}.by("node").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.ready_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.ready_extra_tags)
}

resource "datadog_monitor" "kubelet_ping" {
  count   = var.kubelet_ping_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node Kubelet API does not respond"
  message = coalesce(var.kubelet_ping_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes.kubelet.check.ping"${module.filter-tags.service_check}.by("name").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.kubelet_ping_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.kubelet_ping_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.kubelet_ping_extra_tags)
}

resource "datadog_monitor" "kubelet_syncloop" {
  count   = var.kubelet_syncloop_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node Kubelet sync loop that updates containers does not work"
  message = coalesce(var.kubelet_syncloop_message, var.message)
  type    = "service check"

  query = <<EOQ
    "kubernetes.kubelet.check.syncloop"${module.filter-tags.service_check}.by("name").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.kubelet_syncloop_threshold_warning
    critical = 5
  }

  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.kubelet_syncloop_extra_tags)
}

resource "datadog_monitor" "unregister_net_device" {
  count   = var.unregister_net_device_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node Frequent unregister net device"
  message = coalesce(var.unregister_net_device_message, var.message)
  type    = "event alert"

  query = <<EOQ
    events('sources:kubernetes priority:all ${module.filter-tags.event_alert} \"UnregisterNetDevice\"').rollup('count').last('${var.unregister_net_device_timeframe}') > ${var.unregister_net_device_threshold_critical}
EOQ

  new_host_delay    = var.new_host_delay
  notify_no_data    = false
  renotify_interval = 0
  notify_audit      = false
  timeout_h         = 0
  include_tags      = true
  locked            = false

  tags = concat(module.monitor-tags.tags, var.unregister_net_device_extra_tags)
}

resource "datadog_monitor" "node_unschedulable" {
  count   = var.node_unschedulable_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node unschedulable"
  message = coalesce(var.node_unschedulable_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.node_unschedulable_time_aggregator}(${var.node_unschedulable_timeframe}):
      sum:kubernetes_state.node.status${module.filter-tags-unschedulable.query_alert} by {node}
    > 0
EOQ

  monitor_thresholds {
    critical = 0
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.node_unschedulable_extra_tags)
}

resource "datadog_monitor" "volume_space" {
  count   = var.volume_space_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node volume space usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.volume_space_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.volume_space_time_aggregator}(${var.volume_space_timeframe}):
      avg:kubernetes.kubelet.volume.stats.used_bytes${module.filter-tags.query_alert} by {name,persistentvolumeclaim} /
      avg:kubernetes.kubelet.volume.stats.capacity_bytes${module.filter-tags.query_alert} by {name,persistentvolumeclaim}
    * 100 > ${var.volume_space_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.volume_space_threshold_critical
    warning  = var.volume_space_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.volume_space_extra_tags)
}

resource "datadog_monitor" "volume_inodes" {
  count   = var.volume_inodes_enabled == "true" ? 1 : 0
  name    = "${coalesce(var.name_prefix, "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}]")} Kubernetes Node volume inodes usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.volume_inodes_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.volume_inodes_time_aggregator}(${var.volume_inodes_timeframe}):
      avg:kubernetes.kubelet.volume.stats.inodes_used${module.filter-tags.query_alert} by {name,persistentvolumeclaim} /
      avg:kubernetes.kubelet.volume.stats.inodes${module.filter-tags.query_alert} by {name,persistentvolumeclaim}
    * 100 > ${var.volume_inodes_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.volume_inodes_threshold_critical
    warning  = var.volume_inodes_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(module.monitor-tags.tags, var.volume_inodes_extra_tags)
}

