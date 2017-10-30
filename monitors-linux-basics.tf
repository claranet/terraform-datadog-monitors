resource "datadog_monitor" "cpu_80_15min" {
  name    = "[${var.env}] CPU High > ${var.cpu_15_critical} for 15 min on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"
  count   = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  query = "min(last_15m):avg:system.cpu.system{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region} + avg:system.cpu.user{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region} > ${var.cpu_15_critical}"
  type  = "query alert"

  thresholds {
    critical = "${var.cpu_15_critical}"
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "cpu_95_5min" {
  name    = "[${var.env}] CPU High > ${var.cpu_5_critical} for 5 min on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query = "min(last_5m):avg:system.cpu.system{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region} + avg:system.cpu.user{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region} > ${var.cpu_5_critical}"
  type  = "query alert"
  count   = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  thresholds {
    critical = "${var.cpu_5_critical}"
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_disk_space_5" {
  name   = "[${var.env}] Free disk space < 5%  on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}"

  query   = "sum(last_5m):avg:system.disk.free{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region, device} / avg:system.disk.total{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region, device} * 100 < 5"
  type  = "query alert"
  count   = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  thresholds {
    critical = 5
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_disk_space_10" {
  name    = "[${var.env}] Free disk space < 10% on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group}\n{{/is_warning}}\n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  query = "sum(last_5m):avg:system.disk.free{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region,device} / avg:system.disk.total{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region, device} * 100 < 10"
  type  = "query alert"
  count = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  thresholds {
    warning  = 20
    critical = 10
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_disk_space_inodes_5" {
  name    = "[${var.env}] Free disk inodes < 5% on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group} \n{{/is_recovery}}"

  query = "sum(last_5m):avg:system.fs.inodes.free{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region, device} / avg:system.fs.inodes.total{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,region, device} * 100 < 5"
  type  = "query alert"
  count = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  thresholds {
    critical = 5
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_disk_space_inodes_10" {
  name    = "[${var.env}] Free disk inodes < 10% on {{host.name}}"
  message = "{{#is_alert}}\n${var.hno_escalation_group}\n{{/is_alert}}\n{{#is_recovery}}\n${var.hno_escalation_group}\n{{/is_recovery}}\n{{#is_warning}}\n${var.ho_escalation_group}\n{{/is_warning}}\n{{#is_warning_recovery}}\n${var.ho_escalation_group}\n{{/is_warning_recovery}}"

  query = "max(last_5m):avg:system.fs.inodes.free{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,device,region} / avg:system.fs.inodes.total{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled} by {host,device,region} * 100 < 10"
  type  = "query alert"
  count = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  thresholds {
    warning  = 20
    critical = 10
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

# resource "datadog_monitor" "datadog_cpu_load" {
#   name    = "CPU Load > 2"
#   message = "Debugging alert - no escalation"

#   query = "min(last_5m):avg:system.load.5{dd_monitoring:enabled,dd_linux_basics:enabled,!dd_custom_cpu:enabled} by {instance-id} / avg:gcp.gce.instance.cpu.reserved_cores{*} by {instance-id} > 2"
#   type  = "query alert"
#   count = "${var.dd_linux_basics == "enabled" ? 1 : 0}"


  # notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  # evaluation_delay    = "${var.linux_basics_config["delay"]}"
  # new_host_delay      = "${var.linux_basics_config["delay"]}"
  # renotify_interval   = 60
  # notify_audit        = false
  # timeout_h           = 0
  # include_tags        = true
  # locked              = false
  # require_full_window = true
  # no_data_timeframe   = 20
# }


resource "datadog_monitor" "datadog_free_memory" {
  name   = "[${var.env}] Free memory < 5% on {{host.name}}"
  message = "Debugging alert - no escalation"

  query = "sum(last_1m):avg:system.mem.free{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_memory:enabled} by {host,region} / avg:system.mem.total{dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_memory:enabled} by {host,region} * 100 < 5"
  type  = "query alert"
  count = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  thresholds {
    critical = 5
  }

  notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  evaluation_delay    = "${var.linux_basics_config["delay"]}"
  new_host_delay      = "${var.linux_basics_config["delay"]}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

# resource "datadog_monitor" "datadog_host_unreachable" {
#   name    = "Host unreachable"
#   message = "{{#is_alert}}\n${var.hno_escalation_group} \n{{/is_alert}} \n{{#is_recovery}}\n${var.hno_escalation_group} \n{{/is_recovery}}"

#   query = "datadog.agent.up.over(dd_monitoring:enabled,dd_linux_basics:enabled,env:${var.env},!dd_custom_cpu:enabled).last(1).count_by_status()"
#   type  = "service check"
#   count = "${var.dd_linux_basics == "enabled" ? 1 : 0}"

  # notify_no_data      = "${var.linux_basics_config["notify_no_data"]}"
  # evaluation_delay    = "${var.linux_basics_config["delay"]}"
  # new_host_delay      = "${var.linux_basics_config["delay"]}"
  # renotify_interval   = 60
  # notify_audit        = false
  # timeout_h           = 0
  # include_tags        = true
  # locked              = false
  # require_full_window = true
  # no_data_timeframe   = 20
# }
