resource "datadog_monitor" "cpu_80_15min" {
  name    = "CPU High > 80% for 15 min"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"
  count   = "${var.linux-basics == "enabled" ? 1 : 0}"

  query = "min(last_15m):avg:system.cpu.system{dd_monitoring:enabled,!dd_custom_cpu:enabled} by {host} + avg:system.cpu.user{dd_monitoring:enabled,!dd_custom_cpu:enabled} by {host} > 80"
  type  = "query alert"

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

resource "datadog_monitor" "cpu_95_5min" {
  name    = "CPU High > 95% for 5 min"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "min(last_5m):avg:system.cpu.system{dd_monitoring:enabled,!dd_custom_cpu:enabled} by {host} + avg:system.cpu.user{dd_monitoring:enabled,!dd_custom_cpu:enabled} by {host} > 95"
  type  = "query alert"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

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

resource "datadog_monitor" "datadog_free_disk_space_5" {
  name    = "Free disk space < 5%"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "sum(last_5m):avg:system.disk.free{*} by {host,device} / avg:system.disk.total{*} by {host,device} * 100 < 5"
  type  = "query alert"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

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

resource "datadog_monitor" "datadog_free_disk_space_10" {
  name    = "Free disk space < 10%"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group}\n{{/is_warning}}\n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  query = "sum(last_5m):avg:system.disk.free{*} by {host,device} / avg:system.disk.total{*} by {host,device} * 100 < 10"
  type  = "query alert"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

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

resource "datadog_monitor" "datadog_free_disk_space_inodes_5" {
  name    = "Free disk inodes < 5%"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group} \n{{/is_recovery}}"

  query = "sum(last_5m):avg:system.fs.inodes.free{*} by {host,device} / avg:system.fs.inodes.total{*} by {host,device} * 100 < 5"
  type  = "query alert"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

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

resource "datadog_monitor" "datadog_free_disk_space_inodes_10" {
  name    = "Free disk inodes < 10%"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group} \n{{/is_recovery}}"

  query = "max(last_5m):avg:system.fs.inodes.free{*} by {host,device} / avg:system.fs.inodes.total{*} by {host,device} * 100 < 10"
  type  = "query alert"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

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

resource "datadog_monitor" "datadog_cpu_load" {
  name    = "CPU Load > 2"
  message = "Debugging alert - no escalation"

  query = "min(last_5m):avg:system.load.5{*} by {instance-id} / avg:gcp.gce.instance.cpu.reserved_cores{*} by {instance-id} > 2"
  type  = "query alert"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

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

resource "datadog_monitor" "datadog_free_memory" {
  name    = "Free memory < 5%"
  message = "Debugging alert - no escalation"
  query   = "sum(last_1m):avg:system.mem.free{*} by {host} / avg:system.mem.total{*} by {host} * 100 < 5"
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

resource "datadog_monitor" "datadog_host_unreachable" {
  name    = "Host unreachable"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group} \n{{/is_recovery}}"

  query = "\"datadog.agent.up\".over(\"*\").last(1).count_by_status()"
  type  = "service check"
  count = "${var.linux-basics == "enabled" ? 1 : 0}"

  notify_no_data      = false
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = 300
  notify_no_data      = true
  renotify_interval   = 0
  no_data_timeframe   = 20
}
