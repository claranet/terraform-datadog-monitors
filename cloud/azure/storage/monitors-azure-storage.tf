resource "datadog_monitor" "storage_status" {
  count   = "${var.status_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOQ
    ${var.status_time_aggregator}(${var.status_timeframe}):avg:azure.storage.status${module.filter-tags.query_alert} by {resource_group,region,name} < 1
  EOQ

  thresholds {
    critical = 1
  }

  silenced            = "${var.status_silenced}"
  type                = "metric alert"
  notify_no_data      = true
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "blobservices_availability" {
  count   = "${var.availability_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Blob services is down"
  message = "${coalesce(var.availability_message, var.message)}"

  query = <<EOQ
    ${var.availability_time_aggregator}(${var.availability_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.availability${module.filter-tags.query_alert} by {resource_group,name},
    100)) < ${var.availability_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.availability_threshold_critical}"
    warning  = "${var.availability_threshold_warning}"
  }

  silenced = "${var.availability_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.availability_extra_tags}"]
}

resource "datadog_monitor" "fileservices_availability" {
  count   = "${var.availability_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage File services is down"
  message = "${coalesce(var.availability_message, var.message)}"

  query = <<EOQ
    ${var.availability_time_aggregator}(${var.availability_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.availability${module.filter-tags.query_alert} by {resource_group,name},
    100)) < ${var.availability_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.availability_threshold_critical}"
    warning  = "${var.availability_threshold_warning}"
  }

  silenced = "${var.availability_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.availability_extra_tags}"]
}

resource "datadog_monitor" "queueservices_availability" {
  count   = "${var.availability_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Queue service is down"
  message = "${coalesce(var.availability_message, var.message)}"

  query = <<EOQ
    ${var.availability_time_aggregator}(${var.availability_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.availability${module.filter-tags.query_alert} by {resource_group,name},
    100)) < ${var.availability_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.availability_threshold_critical}"
    warning  = "${var.availability_threshold_warning}"
  }

  silenced = "${var.availability_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.availability_extra_tags}"]
}

resource "datadog_monitor" "table_availability" {
  count   = "${var.availability_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Table service is down"
  message = "${coalesce(var.availability_message, var.message)}"

  query = <<EOQ
    ${var.availability_time_aggregator}(${var.availability_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.availability${module.filter-tags.query_alert} by {resource_group,name},
    100)) < ${var.availability_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.availability_threshold_critical}"
    warning  = "${var.availability_threshold_warning}"
  }

  silenced = "${var.availability_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.availability_extra_tags}"]
}

resource "datadog_monitor" "blobservices_requests_error" {
  count   = "${var.successful_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Blob service too few successful requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.successful_requests_message, var.message)}"

  query = <<EOQ
      ${var.successful_requests_time_aggregator}(${var.successful_requests_timeframe}):
        100-(sum:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-success.query_alert} by {resource_group,name}.as_count() /
        sum:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags.query_alert} by {resource_group,name}.as_count()
      * 100) > ${var.successful_storage_requests_threshold_critical}
    EOQ

  thresholds {
    critical = "${var.successful_storage_requests_threshold_critical}"
    warning  = "${var.successful_storage_requests_threshold_warning}"
  }

  silenced = "${var.successful_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.successful_requests_extra_tags}"]
}

resource "datadog_monitor" "fileservices_requests_error" {
  count   = "${var.successful_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage File service too few successful requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.successful_requests_message, var.message)}"

  query = <<EOQ
      ${var.successful_requests_time_aggregator}(${var.successful_requests_timeframe}):
        100-(sum:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-success.query_alert} by {resource_group,name}.as_count() /
        sum:azure.azure.storage_storageaccounts_fileservices.transactions${module.filter-tags.query_alert} by {resource_group,name}.as_count()
      * 100) > ${var.successful_storage_requests_threshold_critical}
    EOQ

  thresholds {
    critical = "${var.successful_storage_requests_threshold_critical}"
    warning  = "${var.successful_storage_requests_threshold_warning}"
  }

  silenced = "${var.successful_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.successful_requests_extra_tags}"]
}

resource "datadog_monitor" "queueservices_requests_error" {
  count   = "${var.successful_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Queue service too few successful requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.successful_requests_message, var.message)}"

  query = <<EOQ
      ${var.successful_requests_time_aggregator}(${var.successful_requests_timeframe}):
        100-(sum:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-success.query_alert} by {resource_group,name}.as_count() /
        sum:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags.query_alert} by {resource_group,name}.as_count()
      * 100) > ${var.successful_storage_requests_threshold_critical}
    EOQ

  thresholds {
    critical = "${var.successful_storage_requests_threshold_critical}"
    warning  = "${var.successful_storage_requests_threshold_warning}"
  }

  silenced = "${var.successful_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.successful_requests_extra_tags}"]
}

resource "datadog_monitor" "tableservices_requests_error" {
  count   = "${var.successful_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Table service too few successful requests {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.successful_requests_message, var.message)}"

  query = <<EOQ
      ${var.successful_requests_time_aggregator}(${var.successful_requests_timeframe}):
        100-(sum:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-success.query_alert} by {resource_group,name}.as_count() /
        sum:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags.query_alert} by {resource_group,name}.as_count()
      * 100) > ${var.successful_storage_requests_threshold_critical}
    EOQ

  thresholds {
    critical = "${var.successful_storage_requests_threshold_critical}"
    warning  = "${var.successful_storage_requests_threshold_warning}"
  }

  silenced = "${var.successful_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.successful_requests_extra_tags}"]
}

resource "datadog_monitor" "blobservices_latency" {
  count   = "${var.latency_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Blob service too high end to end latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOQ
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.success_e2_elatency${module.filter-tags.query_alert} by {resource_group,name},
    0)) > ${var.latency_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.latency_threshold_critical}"
    warning  = "${var.latency_threshold_warning}"
  }

  silenced = "${var.latency_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.latency_extra_tags}"]
}

resource "datadog_monitor" "fileservices_latency" {
  count   = "${var.latency_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage File service too high end to end latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOQ
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.success_e2_e_latency${module.filter-tags.query_alert} by {resource_group,name},
    0)) > ${var.latency_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.latency_threshold_critical}"
    warning  = "${var.latency_threshold_warning}"
  }

  silenced = "${var.latency_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.latency_extra_tags}"]
}

resource "datadog_monitor" "queueservices_latency" {
  count   = "${var.latency_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Queue service too high end to end latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOQ
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.success_e2_elatency${module.filter-tags.query_alert} by {resource_group,name},
    0)) > ${var.latency_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.latency_threshold_critical}"
    warning  = "${var.latency_threshold_warning}"
  }

  silenced = "${var.latency_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.latency_extra_tags}"]
}

resource "datadog_monitor" "tableservices_latency" {
  count   = "${var.latency_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage Table service too high end to end latency {{#is_alert}}{{{comparator}}} {{threshold}}ms ({{value}}ms){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}ms ({{value}}ms){{/is_warning}}"
  message = "${coalesce(var.latency_message, var.message)}"

  query = <<EOQ
    ${var.latency_time_aggregator}(${var.latency_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.success_e2_elatency${module.filter-tags.query_alert} by {resource_group,name},
    0)) > ${var.latency_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.latency_threshold_critical}"
    warning  = "${var.latency_threshold_warning}"
  }

  silenced = "${var.latency_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.latency_extra_tags}"]
}

resource "datadog_monitor" "blob_timeout_error_requests" {
  count   = "${var.timeout_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Blob Storage too many timeout errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.timeout_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.timeout_error_requests_time_aggregator}(${var.timeout_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-timeout-error.query_alert} by {resource_group,name},
    0)) > ${var.timeout_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.timeout_error_requests_threshold_critical}"
    warning  = "${var.timeout_error_requests_threshold_warning}"
  }

  silenced = "${var.timeout_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.timeout_error_requests_extra_tags}"]
}

resource "datadog_monitor" "file_timeout_error_requests" {
  count   = "${var.timeout_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure File Storage too many timeout errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.timeout_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.timeout_error_requests_time_aggregator}(${var.timeout_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-timeout-error.query_alert} by {resource_group,name},
    0)) > ${var.timeout_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.timeout_error_requests_threshold_critical}"
    warning  = "${var.timeout_error_requests_threshold_warning}"
  }

  silenced = "${var.timeout_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.timeout_error_requests_extra_tags}"]
}

resource "datadog_monitor" "queue_timeout_error_requests" {
  count   = "${var.timeout_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Queue Storage too many timeout errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.timeout_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.timeout_error_requests_time_aggregator}(${var.timeout_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-timeout-error.query_alert} by {resource_group,name},
    0)) > ${var.timeout_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.timeout_error_requests_threshold_critical}"
    warning  = "${var.timeout_error_requests_threshold_warning}"
  }

  silenced = "${var.timeout_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.timeout_error_requests_extra_tags}"]
}

resource "datadog_monitor" "table_timeout_error_requests" {
  count   = "${var.timeout_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Table Storage too many timeout errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.timeout_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.timeout_error_requests_time_aggregator}(${var.timeout_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-timeout-error.query_alert} by {resource_group,name},
    0)) > ${var.timeout_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.timeout_error_requests_threshold_critical}"
    warning  = "${var.timeout_error_requests_threshold_warning}"
  }

  silenced = "${var.timeout_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.timeout_error_requests_extra_tags}"]
}

resource "datadog_monitor" "blob_network_error_requests" {
  count   = "${var.network_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Blob Storage too many network errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.network_error_requests_time_aggregator}(${var.network_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-network-error.query_alert} by {resource_group,name},
    0)) > ${var.network_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.network_error_requests_threshold_critical}"
    warning  = "${var.network_error_requests_threshold_warning}"
  }

  silenced = "${var.network_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.network_error_requests_extra_tags}"]
}

resource "datadog_monitor" "file_network_error_requests" {
  count   = "${var.network_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure File Storage too many network errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.network_error_requests_time_aggregator}(${var.network_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-network-error.query_alert} by {resource_group,name},
    0)) > ${var.network_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.network_error_requests_threshold_critical}"
    warning  = "${var.network_error_requests_threshold_warning}"
  }

  silenced = "${var.network_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.network_error_requests_extra_tags}"]
}

resource "datadog_monitor" "queue_network_error_requests" {
  count   = "${var.network_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Queue Storage too many network errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.network_error_requests_time_aggregator}(${var.network_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-network-error.query_alert} by {resource_group,name},
    0)) > ${var.network_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.network_error_requests_threshold_critical}"
    warning  = "${var.network_error_requests_threshold_warning}"
  }

  silenced = "${var.network_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0


  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.network_error_requests_extra_tags}"]

}

resource "datadog_monitor" "table_network_error_requests" {
  count   = "${var.network_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Table Storage too many network errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.network_error_requests_time_aggregator}(${var.network_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-network-error.query_alert} by {resource_group,name},
    0)) > ${var.network_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.network_error_requests_threshold_critical}"
    warning  = "${var.network_error_requests_threshold_warning}"
  }

  silenced = "${var.network_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.network_error_requests_extra_tags}"]
}

resource "datadog_monitor" "blob_throttling_error_requests" {
  count   = "${var.throttling_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Blob Storage too many throttling errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.throttling_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.throttling_error_requests_time_aggregator}(${var.throttling_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-throttling-error.query_alert} by {resource_group,name},
    0)) > ${var.throttling_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.throttling_error_requests_threshold_critical}"
    warning  = "${var.throttling_error_requests_threshold_warning}"
  }

  silenced = "${var.throttling_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.throttling_error_requests_extra_tags}"]
}

resource "datadog_monitor" "file_throttling_error_requests" {
  count   = "${var.throttling_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage too many throttling errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.throttling_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.throttling_error_requests_time_aggregator}(${var.throttling_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-throttling-error.query_alert} by {resource_group,name},
    0)) > ${var.throttling_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.throttling_error_requests_threshold_critical}"
    warning  = "${var.throttling_error_requests_threshold_warning}"
  }

  silenced = "${var.throttling_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.throttling_error_requests_extra_tags}"]
}

resource "datadog_monitor" "queue_throttling_error_requests" {
  count   = "${var.throttling_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage too many throttling errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.throttling_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.throttling_error_requests_time_aggregator}(${var.throttling_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-throttling-error.query_alert} by {resource_group,name},
    0)) > ${var.throttling_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.throttling_error_requests_threshold_critical}"
    warning  = "${var.throttling_error_requests_threshold_warning}"
  }

  silenced = "${var.throttling_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.throttling_error_requests_extra_tags}"]
}

resource "datadog_monitor" "table_throttling_error_requests" {
  count   = "${var.throttling_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Storage too many throttling errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.throttling_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.throttling_error_requests_time_aggregator}(${var.throttling_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-throttling-error.query_alert} by {resource_group,name},
    0)) > ${var.throttling_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.throttling_error_requests_threshold_critical}"
    warning  = "${var.throttling_error_requests_threshold_warning}"
  }

  silenced = "${var.throttling_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.throttling_error_requests_extra_tags}"]
}

resource "datadog_monitor" "blob_server_other_error_requests" {
  count   = "${var.server_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Blob Storage too many server_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.server_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.server_other_error_requests_time_aggregator}(${var.server_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-server-other-error.query_alert} by {resource_group,name},
    0)) > ${var.server_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.server_other_error_requests_threshold_critical}"
    warning  = "${var.server_other_error_requests_threshold_warning}"
  }

  silenced = "${var.server_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.server_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "file_server_other_error_requests" {
  count   = "${var.server_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure File Storage too many server_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.server_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.server_other_error_requests_time_aggregator}(${var.server_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-server-other-error.query_alert} by {resource_group,name},
    0)) > ${var.server_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.server_other_error_requests_threshold_critical}"
    warning  = "${var.server_other_error_requests_threshold_warning}"
  }

  silenced = "${var.server_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.server_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "queue_server_other_error_requests" {
  count   = "${var.server_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Queue Storage too many server_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.server_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.server_other_error_requests_time_aggregator}(${var.server_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-server-other-error.query_alert} by {resource_group,name},
    0)) > ${var.server_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.server_other_error_requests_threshold_critical}"
    warning  = "${var.server_other_error_requests_threshold_warning}"
  }

  silenced = "${var.server_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0


  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.server_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "table_server_other_error_requests" {
  count   = "${var.server_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Table Storage too many server_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.server_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.server_other_error_requests_time_aggregator}(${var.server_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-server-other-error.query_alert} by {resource_group,name},
    0)) > ${var.server_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.server_other_error_requests_threshold_critical}"
    warning  = "${var.server_other_error_requests_threshold_warning}"
  }

  silenced = "${var.server_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.server_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "blob_client_other_error_requests" {
  count   = "${var.client_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Blob Storage too many client_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.client_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.client_other_error_requests_time_aggregator}(${var.client_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-client-other-error.query_alert} by {resource_group,name},
    0)) > ${var.client_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.client_other_error_requests_threshold_critical}"
    warning  = "${var.client_other_error_requests_threshold_warning}"
  }

  silenced = "${var.client_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.client_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "file_client_other_error_requests" {
  count   = "${var.client_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure File Storage too many client_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.client_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.client_other_error_requests_time_aggregator}(${var.client_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-client-other-error.query_alert} by {resource_group,name},
    0)) > ${var.client_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.client_other_error_requests_threshold_critical}"
    warning  = "${var.client_other_error_requests_threshold_warning}"
  }

  silenced = "${var.client_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.client_other_error_requests_extra_tags}"]

}

resource "datadog_monitor" "queue_client_other_error_requests" {
  count   = "${var.client_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Queue Storage too many client_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.client_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.client_other_error_requests_time_aggregator}(${var.client_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-client-other-error.query_alert} by {resource_group,name},
    0)) > ${var.client_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.client_other_error_requests_threshold_critical}"
    warning  = "${var.client_other_error_requests_threshold_warning}"
  }

  silenced = "${var.client_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.client_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "table_client_other_error_requests" {
  count   = "${var.client_other_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Table Storage too many client_other errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.client_other_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.client_other_error_requests_time_aggregator}(${var.client_other_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-client-other-error.query_alert} by {resource_group,name},
    0)) > ${var.client_other_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.client_other_error_requests_threshold_critical}"
    warning  = "${var.client_other_error_requests_threshold_warning}"
  }

  silenced = "${var.client_other_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.client_other_error_requests_extra_tags}"]
}

resource "datadog_monitor" "blob_authorization_error_requests" {
  count   = "${var.authorization_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Blob Storage too many authorization errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.authorization_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.authorization_error_requests_time_aggregator}(${var.authorization_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_blobservices.transactions${module.filter-tags-authorization-error.query_alert} by {resource_group,name},
    0)) > ${var.authorization_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.authorization_error_requests_threshold_critical}"
    warning  = "${var.authorization_error_requests_threshold_warning}"
  }

  silenced = "${var.authorization_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.authorization_error_requests_extra_tags}"]
}

resource "datadog_monitor" "file_authorization_error_requests" {
  count   = "${var.authorization_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure File Storage too many authorization errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.authorization_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.authorization_error_requests_time_aggregator}(${var.authorization_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_fileservices.transactions${module.filter-tags-authorization-error.query_alert} by {resource_group,name},
    0)) > ${var.authorization_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.authorization_error_requests_threshold_critical}"
    warning  = "${var.authorization_error_requests_threshold_warning}"
  }

  silenced = "${var.authorization_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  lifecycle {
    ignore_changes = ["silenced"]
  }

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.authorization_error_requests_extra_tags}"]
}

resource "datadog_monitor" "queue_authorization_error_requests" {
  count   = "${var.authorization_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Queue Storage too many authorization errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.authorization_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.authorization_error_requests_time_aggregator}(${var.authorization_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_queueservices.transactions${module.filter-tags-authorization-error.query_alert} by {resource_group,name},
    0)) > ${var.authorization_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.authorization_error_requests_threshold_critical}"
    warning  = "${var.authorization_error_requests_threshold_warning}"
  }

  silenced = "${var.authorization_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.authorization_error_requests_extra_tags}"]
}

resource "datadog_monitor" "table_authorization_error_requests" {
  count   = "${var.authorization_error_requests_enabled == "true" ? 1 : 0}"
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Azure Table Storage too many authorization errors {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.authorization_error_requests_message, var.message)}"

  query = <<EOQ
    ${var.authorization_error_requests_time_aggregator}(${var.authorization_error_requests_timeframe}): (default(
      avg:azure.storage_storageaccounts_tableservices.transactions${module.filter-tags-authorization-error.query_alert} by {resource_group,name},
    0)) > ${var.authorization_error_requests_threshold_critical}
  EOQ

  thresholds {
    critical = "${var.authorization_error_requests_threshold_critical}"
    warning  = "${var.authorization_error_requests_threshold_warning}"
  }

  silenced = "${var.authorization_error_requests_silenced}"

  type                = "metric alert"
  notify_no_data      = false
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:storage", "team:claranet", "created-by:terraform", "${var.authorization_error_requests_extra_tags}"]
}
