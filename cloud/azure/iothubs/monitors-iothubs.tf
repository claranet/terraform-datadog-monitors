data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_appservices:enabled,subscription_id:%s,env:%s", var.subscription_id,var.environment) : var.subscription_id}"
  }
}

resource "datadog_monitor" "too_many_jobs_failed" {
  name    = "[${var.environment}] IOT Hub Too many jobs failed on {{name}}"
  message = "${var.message}"

  query = <<EOF
          avg(last_5m):(
            avg:azure.devices_iothubs.jobs.failed{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() /
            ( avg:azure.devices_iothubs.jobs.failed{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() +
                avg:azure.devices_iothubs.jobs.completed{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() )
          ) * 100 > ${var.jobs_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.jobs_failed_threshold_warning}"
    critical = "${var.jobs_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_list_jobs_failed" {
  name    = "[${var.environment}] IOT Hub Too many list_jobs failure on {{name}}"
  message = "${var.message}"

  query = <<EOF
          avg(last_5m):(
            avg:azure.devices_iothubs.jobs.list_jobs.failure{subscription_id:${var.subscription_id}} by {resource_group,name}.as_count() /
              ( avg:azure.devices_iothubs.jobs.list_jobs.success{subscription_id:${var.subscription_id}} by {resource_group,name}.as_count() +
                  avg:azure.devices_iothubs.jobs.list_jobs.failure{subscription_id:${var.subscription_id}} by {resource_group,name}.as_count() )
          ) * 100 > ${var.listjobs_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.listjobs_failed_threshold_warning}"
    critical = "${var.listjobs_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_query_jobs_failed" {
  name    = "[${var.environment}] IOT Hub Too many query_jobs failed on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):(
      avg:azure.devices_iothubs.jobs.query_jobs.failure{subscription_id:${var.subscription_id}} by {resource_group,name}.as_count() /
        ( avg:azure.devices_iothubs.jobs.query_jobs.success{subscription_id:${var.subscription_id}} by {resource_group,name}.as_count() +
            avg:azure.devices_iothubs.jobs.query_jobs.failure{subscription_id:${var.subscription_id}} by {resource_group,name}.as_count() )
    ) * 100 > ${var.queryjobs_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.queryjobs_failed_threshold_warning}"
    critical = "${var.queryjobs_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "status" {
  name    = "[${var.environment}] IOT Hub Status is not ok on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):avg:azure.devices_iothubs.status{subscription_id:${var.subscription_id}} by {name,resource_group} < 1
  EOF
  type  = "query alert"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "total_devices" {
  name    = "[${var.environment}] IOT Hub Total devices is wrong on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):avg:azure.devices_iothubs.devices.total_devices{subscription_id:${var.subscription_id}} by {name,resource_group} == 0
  EOF
  type  = "query alert"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_c2d_methods_failed" {
  name    = "[${var.environment}] IOT Hub Too many c2d methods failure on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):(
      avg:azure.devices_iothubs.c2d.methods.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() /
        ( avg:azure.devices_iothubs.c2d.methods.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() +
            avg:azure.devices_iothubs.c2d.methods.success{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() )
    ) * 100 > ${var.c2d_methods_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.c2d_methods_failed_threshold_warning}"
    critical = "${var.c2d_methods_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_c2d_twin_read_failed" {
  name    = "[${var.environment}] IOT Hub Too many c2d twin read failure on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):(
      avg:azure.devices_iothubs.c2d.twin.read.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() /
        ( avg:azure.devices_iothubs.c2d.twin.read.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() +
            avg:azure.devices_iothubs.c2d.twin.read.success{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() )
    ) * 100 > ${var.c2d_twin_read_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.c2d_twin_read_failed_threshold_warning}"
    critical = "${var.c2d_twin_read_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_c2d_twin_update_failed" {
  name    = "[${var.environment}] IOT Hub Too many c2d twin update failure on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):(
      avg:azure.devices_iothubs.c2d.twin.update.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() /
      ( avg:azure.devices_iothubs.c2d.twin.update.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() +
          avg:azure.devices_iothubs.c2d.twin.update.success{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() )
    ) * 100 > ${var.c2d_twin_update_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.c2d_twin_update_failed_threshold_warning}"
    critical = "${var.c2d_twin_update_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_twin_read_failed" {
  name    = "[${var.environment}] IOT Hub Too many d2c twin read failure on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):(
      avg:azure.devices_iothubs.d2c.twin.read.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() /
        ( avg:azure.devices_iothubs.d2c.twin.read.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() +
          avg:azure.devices_iothubs.d2c.twin.read.success{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() )
    ) * 100 > ${var.d2c_twin_read_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.d2c_twin_read_failed_threshold_warning}"
    critical = "${var.d2c_twin_read_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_twin_update_failed" {
  name    = "[${var.environment}] IOT Hub Too many d2c twin update failure on {{name}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m):(
      avg:azure.devices_iothubs.d2c.twin.update.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() /
        ( avg:azure.devices_iothubs.d2c.twin.update.failure{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() +
          avg:azure.devices_iothubs.d2c.twin.update.success{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() )
    ) * 100 > ${var.d2c_twin_update_failed_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.d2c_twin_update_failed_threshold_warning}"
    critical = "${var.d2c_twin_update_failed_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_dropped" {
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress dropped on {{name}}"
  message = "${var.message}"

  query = <<EOF
      sum(last_5m): (
        avg:azure.devices_iothubs.d2c.telemetry.egress.dropped{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count()
      ) > ${var.d2c_telemetry_egress_dropped_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.d2c_telemetry_egress_dropped_threshold_warning}"
    critical = "${var.d2c_telemetry_egress_dropped_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_orphaned" {
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress orphaned on {{name}}"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.devices_iothubs.d2c.telemetry.egress.orphaned{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count()
    ) > ${var.d2c_telemetry_egress_orphaned_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.d2c_telemetry_egress_orphaned_threshold_warning}"
    critical = "${var.d2c_telemetry_egress_orphaned_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_invalid" {
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress invalid on {{name}}"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.devices_iothubs.d2c.telemetry.egress.invalid{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count()
    ) > ${var.d2c_telemetry_egress_invalid_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.d2c_telemetry_egress_invalid_threshold_warning}"
    critical = "${var.d2c_telemetry_egress_invalid_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_telemetry_egress_fallback" {
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry egress fallback on {{name}}"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.devices_iothubs.d2c.telemetry.egress.fallback{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count()
    )  > ${var.d2c_telemetry_egress_fallback_threshold_critical}
  EOF
  type  = "query alert"

  thresholds {
    warning  = "${var.d2c_telemetry_egress_fallback_threshold_warning}"
    critical = "${var.d2c_telemetry_egress_fallback_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}

resource "datadog_monitor" "too_many_d2c_telemetry_ingress_nosent" {
  name    = "[${var.environment}] IOT Hub Too many d2c telemetry ingress no sent on {{name}}"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:azure.devices_iothubs.d2c.telemetry.ingress.all_protocol{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count() -
        avg:azure.devices_iothubs.d2c.telemetry.ingress.success{subscription_id:${var.subscription_id}} by {name,resource_group}.as_count()
    ) > 0
  EOF
  type  = "query alert"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
}
