### Elasticsearch cluster status monitor ###
/* Note about the query
    - If aws.es.cluster_statusred is 1 --> query value (= 2.1) > 2 : critical
    - If aws.es.cluster_statusyellow is 1 --> 1 < query value (=1.1) < 2 : warning
    Workaround : in the query, we add "0.1" to the result and we use the comparator ">=". No alert was triggered without that. */
resource "datadog_monitor" "es_cluster_status" {
  count   = var.es_cluster_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch cluster status is not green"
  message = coalesce(var.es_cluster_status_message, var.message)
  type    = "query alert"

  query = <<EOQ
  max(${var.es_cluster_status_timeframe}): (
    avg:aws.es.cluster_statusred${module.filter-tags.query_alert} by {region,name} * 2 +
    (avg:aws.es.cluster_statusyellow${module.filter-tags.query_alert} by {region,name} + 0.1)
  ) >= 2
EOQ

  thresholds = {
    warning  = 1
    critical = 2
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.es_cluster_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.es_cluster_status_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

### Elasticsearch cluster free storage space monitor ###
resource "datadog_monitor" "es_free_space_low" {
  count   = var.diskspace_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch cluster free storage space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.diskspace_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
    avg:aws.es.free_storage_space${module.filter-tags.query_alert} by {region,name} /
    (${var.es_cluster_volume_size}*1000) * 100
  ) < ${var.diskspace_threshold_critical}
EOQ

  thresholds = {
    warning  = var.diskspace_threshold_warning
    critical = var.diskspace_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.diskspace_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

### Elasticsearch cluster CPU monitor ###
resource "datadog_monitor" "es_cpu_90_15min" {
  count   = var.cpu_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch cluster CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
    avg:aws.es.cpuutilization${module.filter-tags.query_alert} by {region,name}
  ) > ${var.cpu_threshold_critical}
EOQ

  thresholds = {
    warning  = var.cpu_threshold_warning
    critical = var.cpu_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.cpu_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

### Elasticsearch cluster 5xx monitor ###
resource "datadog_monitor" "es_error_5xx" {
  count   = var.es_5xx_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ElasticSearch cluster 5xx errors too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.es_5xx_message, var.message)
  type    = "query alert"
  
  query = <<EOQ
    sum(${var.es_5xx_timeframe}):
      default(avg:aws.es.5xx.average${module.filter-tags.query_alert} by {region,name}.as_rate(), 0) > ${var.es_5xx_threshold_critical}
EOQ

  thresholds = {
    warning  = var.es_5xx_threshold_warning
    critical = var.es_5xx_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticsearch", "team:claranet", "created-by:terraform"], var.es_5xx_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

