resource "datadog_monitor" "too_many_jobs_failed" {
  count   = "${var.failed_jobs_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many jobs failed {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_jobs_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_jobs_rate_time_aggregator}(${var.failed_jobs_rate_timeframe}):(
      default(avg:azure.devices_iothubs.jobs.failed{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.jobs.failed{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.jobs.completed{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_jobs_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_jobs_rate_threshold_warning}"
    critical = "${var.failed_jobs_rate_threshold_critical}"
  }

  silenced = "${var.failed_jobs_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_jobs_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_list_jobs_failed" {
  count   = "${var.failed_listjobs_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many list_jobs failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_listjobs_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_listjobs_rate_time_aggregator}(${var.failed_listjobs_rate_timeframe}):(
      default(avg:azure.devices_iothubs.jobs.list_jobs.failure{${var.filter_tags}} by {resource_group,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.jobs.list_jobs.success{${var.filter_tags}} by {resource_group,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.jobs.list_jobs.failure{${var.filter_tags}} by {resource_group,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_listjobs_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_listjobs_rate_threshold_warning}"
    critical = "${var.failed_listjobs_rate_threshold_critical}"
  }

  silenced = "${var.failed_listjobs_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_listjobs_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_query_jobs_failed" {
  count   = "${var.failed_queryjobs_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many query_jobs failed {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_queryjobs_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_queryjobs_rate_time_aggregator}(${var.failed_queryjobs_rate_timeframe}):(
      default(avg:azure.devices_iothubs.jobs.query_jobs.failure{${var.filter_tags}} by {resource_group,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.jobs.query_jobs.success{${var.filter_tags}} by {resource_group,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.jobs.query_jobs.failure{${var.filter_tags}} by {resource_group,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_queryjobs_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_queryjobs_rate_threshold_warning}"
    critical = "${var.failed_queryjobs_rate_threshold_critical}"
  }

  silenced = "${var.failed_queryjobs_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_queryjobs_rate_extra_tags}"]
}

resource "datadog_monitor" "status" {
  count   = "${var.status_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
    ${var.status_time_aggregator}(${var.status_timeframe}): (
      avg:azure.devices_iothubs.status{${var.filter_tags}} by {resource_group,region,name}
    ) < 1
  EOF

  type = "metric alert"

  silenced = "${var.status_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "total_devices" {
  count   = "${var.total_devices_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Total devices is wrong {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.total_devices_message, var.message)}"

  query = <<EOF
    ${var.total_devices_time_aggregator}(${var.total_devices_timeframe}): (
      avg:azure.devices_iothubs.devices.total_devices{${var.filter_tags}} by {resource_group,region,name}
    ) == 0
  EOF

  type = "metric alert"

  silenced = "${var.total_devices_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.total_devices_extra_tags}"]
}

resource "datadog_monitor" "too_many_c2d_methods_failed" {
  count   = "${var.failed_c2d_methods_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many c2d methods failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_c2d_methods_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_c2d_methods_rate_time_aggregator}(${var.failed_c2d_methods_rate_timeframe}):(
      default(avg:azure.devices_iothubs.c2d.methods.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.c2d.methods.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.c2d.methods.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_c2d_methods_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_c2d_methods_rate_threshold_warning}"
    critical = "${var.failed_c2d_methods_rate_threshold_critical}"
  }

  silenced = "${var.failed_c2d_methods_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_c2d_methods_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_c2d_twin_read_failed" {
  count   = "${var.failed_c2d_twin_read_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many c2d twin read failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_c2d_twin_read_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_c2d_twin_read_rate_time_aggregator}(${var.failed_c2d_twin_read_rate_timeframe}):(
      default(avg:azure.devices_iothubs.c2d.twin.read.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.c2d.twin.read.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.c2d.twin.read.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_c2d_twin_read_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_c2d_twin_read_rate_threshold_warning}"
    critical = "${var.failed_c2d_twin_read_rate_threshold_critical}"
  }

  silenced = "${var.failed_c2d_twin_read_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_c2d_twin_read_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_c2d_twin_update_failed" {
  count   = "${var.failed_c2d_twin_update_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many c2d twin update failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_c2d_twin_update_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_c2d_twin_update_rate_time_aggregator}(${var.failed_c2d_twin_update_rate_timeframe}):(
      default(avg:azure.devices_iothubs.c2d.twin.update.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.c2d.twin.update.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.c2d.twin.update.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_c2d_twin_update_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_c2d_twin_update_rate_threshold_warning}"
    critical = "${var.failed_c2d_twin_update_rate_threshold_critical}"
  }

  silenced = "${var.failed_c2d_twin_update_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_c2d_twin_update_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_d2c_twin_read_failed" {
  count   = "${var.failed_d2c_twin_read_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many d2c twin read failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_d2c_twin_read_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_d2c_twin_read_rate_time_aggregator}(${var.failed_d2c_twin_read_rate_timeframe}):(
      default(avg:azure.devices_iothubs.d2c.twin.read.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.twin.read.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.twin.read.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_d2c_twin_read_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_d2c_twin_read_rate_threshold_warning}"
    critical = "${var.failed_d2c_twin_read_rate_threshold_critical}"
  }

  silenced = "${var.failed_d2c_twin_read_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_d2c_twin_read_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_d2c_twin_update_failed" {
  count   = "${var.failed_d2c_twin_update_rate_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many d2c twin update failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.failed_d2c_twin_update_rate_message, var.message)}"

  query = <<EOF
    ${var.failed_d2c_twin_update_rate_time_aggregator}(${var.failed_d2c_twin_update_rate_timeframe}):(
      default(avg:azure.devices_iothubs.d2c.twin.update.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.twin.update.failure{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.twin.update.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.failed_d2c_twin_update_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.failed_d2c_twin_update_rate_threshold_warning}"
    critical = "${var.failed_d2c_twin_update_rate_threshold_critical}"
  }

  silenced = "${var.failed_d2c_twin_update_rate_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.failed_d2c_twin_update_rate_extra_tags}"]
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_dropped" {
  count   = "${var.dropped_d2c_telemetry_egress_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress dropped {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.dropped_d2c_telemetry_egress_message, var.message)}"

  query = <<EOF
    ${var.dropped_d2c_telemetry_egress_time_aggregator}(${var.dropped_d2c_telemetry_egress_timeframe}): (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.dropped_d2c_telemetry_egress_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.dropped_d2c_telemetry_egress_rate_threshold_warning}"
    critical = "${var.dropped_d2c_telemetry_egress_rate_threshold_critical}"
  }

  silenced = "${var.dropped_d2c_telemetry_egress_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.dropped_d2c_telemetry_egress_extra_tags}"]
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_orphaned" {
  count   = "${var.orphaned_d2c_telemetry_egress_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress orphaned {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.orphaned_d2c_telemetry_egress_message, var.message)}"

  query = <<EOF
    ${var.orphaned_d2c_telemetry_egress_time_aggregator}(${var.orphaned_d2c_telemetry_egress_timeframe}): (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.orphaned_d2c_telemetry_egress_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.orphaned_d2c_telemetry_egress_rate_threshold_warning}"
    critical = "${var.orphaned_d2c_telemetry_egress_rate_threshold_critical}"
  }

  silenced = "${var.orphaned_d2c_telemetry_egress_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.orphaned_d2c_telemetry_egress_extra_tags}"]
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_invalid" {
  count   = "${var.invalid_d2c_telemetry_egress_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress invalid {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.invalid_d2c_telemetry_egress_message, var.message)}"

  query = <<EOF
    ${var.invalid_d2c_telemetry_egress_time_aggregator}(${var.invalid_d2c_telemetry_egress_timeframe}): (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) / (
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.dropped{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.invalid{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) +
      default(avg:azure.devices_iothubs.d2c.telemetry.egress.success{${var.filter_tags}} by {resource_group,region,name}.as_rate(), 0) )
    ) * 100 > ${var.invalid_d2c_telemetry_egress_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.invalid_d2c_telemetry_egress_rate_threshold_warning}"
    critical = "${var.invalid_d2c_telemetry_egress_rate_threshold_critical}"
  }

  silenced = "${var.invalid_d2c_telemetry_egress_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.invalid_d2c_telemetry_egress_extra_tags}"]
}

resource "datadog_monitor" "too_many_d2c_telemetry_ingress_nosent" {
  count   = "${var.too_many_d2c_telemetry_ingress_nosent_enabled ? 1 : 0}"
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry ingress not sent {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.too_many_d2c_telemetry_ingress_nosent_message, var.message)}"

  query = <<EOF
    sum(${var.too_many_d2c_telemetry_ingress_nosent_timeframe}): (
      avg:azure.devices_iothubs.d2c.telemetry.ingress.all_protocol{${var.filter_tags}} by {resource_group,region,name}.as_count() -
      avg:azure.devices_iothubs.d2c.telemetry.ingress.success{${var.filter_tags}} by {resource_group,region,name}.as_count()
    ) > 0
  EOF

  type = "metric alert"

  silenced = "${var.too_many_d2c_telemetry_ingress_nosent_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:iothubs", "team:claranet", "created-by:terraform", "${var.too_many_d2c_telemetry_ingress_nosent_extra_tags}"]
}
