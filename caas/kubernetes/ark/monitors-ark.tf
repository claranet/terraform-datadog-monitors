data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
             format("dd_monitoring:enabled,dd_k8s:enabled,env:%s", var.environment) :
             "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "ark_schedules_monitor" {
  name    = "[${var.environment}] [${var.team}] Ark backup failed on {{schedule.name}}"
  type    = "metric alert"
  message = "${coalesce(var.ark_schedules_monitor_message, var.message)}"

  query = <<EOF
    sum(${var.ark_schedules_monitor_timeframe}):min:ark.ark_backup_failure_total{${data.template_file.filter.rendered}} by {schedule}.as_count() > 1
  EOF

  thresholds {
    critical = 1
    warning  = 0
  }

  evaluation_delay  = "${var.delay}"
  new_host_delay    = "${var.delay}"
  no_data_timeframe = "${var.ark_schedules_monitor_no_data_timeframe}"

  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  silenced = "${var.ark_schedules_monitor_silenced}"
  tags     = ["team:${var.team}", "env:${var.environment}", "resource:ark", "provider:prometheus"]
}
