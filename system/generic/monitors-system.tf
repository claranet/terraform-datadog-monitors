resource "datadog_monitor" "datadog_cpu_too_high" {
  name    = "[${var.environment}] CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  query = <<EOF
    ${var.cpu_high_time_aggregator}(${var.cpu_high_timeframe}): (
      100 - avg:system.cpu.idle${module.filter-tags.query_alert} by {region,host}
    ) > ${var.cpu_high_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_high_threshold_warning}"
    critical = "${var.cpu_high_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system", "resource:cpu"]

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.cpu_high_silenced}"
}

resource "datadog_monitor" "datadog_load_too_high" {
  name    = "[${var.environment}] CPU load 5 {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_load_message, var.message)}"

  query = <<EOF
    ${var.cpu_load_time_aggregator}(${var.cpu_load_timeframe}): (
      avg:system.load.5${module.filter-tags.query_alert} by {region,host} /
      avg:system.core.count${module.filter-tags.query_alert} by {region,host}
    ) > ${var.cpu_load_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_load_threshold_warning}"
    critical = "${var.cpu_load_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system", "resource:load"]

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.cpu_load_silenced}"
}

resource "datadog_monitor" "datadog_free_disk_space_too_low" {
  name    = "[${var.environment}] Free disk space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_disk_space_message, var.message)}"

  query = <<EOF
    ${var.free_disk_space_time_aggregator}(${var.free_disk_space_timeframe}): (
      avg:system.disk.free${module.filter-tags-disk.query_alert} by {region,host,device} /
      avg:system.disk.total${module.filter-tags-disk.query_alert} by {region,host,device} * 100
    ) < ${var.free_disk_space_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_disk_space_threshold_warning}"
    critical = "${var.free_disk_space_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system", "resource:disk"]

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.free_disk_space_silenced}"
}

resource "datadog_monitor" "datadog_free_disk_space_inodes_too_low" {
  name    = "[${var.environment}] Free disk inodes {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_disk_inodes_message, var.message)}"

  query = <<EOF
    ${var.free_disk_inodes_time_aggregator}(${var.free_disk_inodes_timeframe}): (
      avg:system.fs.inodes.free${module.filter-tags-disk.query_alert} by {region,host,device} /
      avg:system.fs.inodes.total${module.filter-tags-disk.query_alert} by {region,host,device} * 100
    ) < ${var.free_disk_inodes_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_disk_inodes_threshold_warning}"
    critical = "${var.free_disk_inodes_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system", "resource:disk"]

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.free_disk_inodes_silenced}"
}

resource "datadog_monitor" "datadog_free_memory" {
  name    = "[${var.environment}] Free memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.free_memory_message}"

  query = <<EOF
    ${var.free_memory_time_aggregator}(${var.free_memory_timeframe}): (
      avg:system.mem.usable${module.filter-tags.query_alert} by {region,host} /
      avg:system.mem.total${module.filter-tags.query_alert} by {region,host} * 100
    ) < ${var.free_memory_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_memory_threshold_warning}"
    critical = "${var.free_memory_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system", "resource:memory"]

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.free_memory_silenced}"
}
