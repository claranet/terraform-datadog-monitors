resource "datadog_monitor" "cosmos_db_status" {
  count   = var.status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cosmos DB is down"
  message = coalesce(var.status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
      ${var.status_time_aggregator}(${var.status_timeframe}):
        avg:azure.cosmosdb.count${module.filter-tags.query_alert} by {resource_group,region,name}
      < 1
EOQ

  monitor_thresholds {
    critical = 1
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.cosmos_db_status_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.status_extra_tags)
}

resource "datadog_monitor" "cosmos_db_4xx_requests" {
  count   = var.cosmos_db_4xx_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cosmos DB 4xx requests rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cosmos_db_4xx_requests_message, var.message)
  type    = "query alert"

  # List of available status codes : https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb
  query = <<EOQ
    ${var.cosmos_db_4xx_request_time_aggregator}(${var.cosmos_db_4xx_request_timeframe}): default( (
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "400")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "401")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "403")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "404")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "408")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "409")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "412")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "413")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "429")} by {resource_group,region,name,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "449")} by {resource_group,region,name,collectionname}.as_rate(), 0) ) /
      default(sum:azure.cosmosdb.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,databasename,collectionname}.as_rate(), 0)
    , 0) * 100 > ${var.cosmos_db_4xx_request_rate_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cosmos_db_4xx_request_rate_threshold_critical
    warning  = var.cosmos_db_4xx_request_rate_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.cosmos_db_4xx_request_extra_tags)
}

resource "datadog_monitor" "cosmos_db_5xx_requests" {
  count   = var.cosmos_db_5xx_requests_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cosmos DB 5xx requests rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cosmos_db_5xx_requests_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cosmos_db_5xx_request_time_aggregator}(${var.cosmos_db_5xx_request_timeframe}): default( (
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "500")} by {resource_group,region,name,databasename,collectionname}.as_rate(), 0) +
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "503")} by {resource_group,region,name,databasename,collectionname}.as_rate(), 0)) /
      default(sum:azure.cosmosdb.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_rate(), 0)
    , 0) * 100 > ${var.cosmos_db_5xx_request_rate_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cosmos_db_5xx_request_rate_threshold_critical
    warning  = var.cosmos_db_5xx_request_rate_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.cosmos_db_5xx_request_rate_extra_tags)
}

resource "datadog_monitor" "cosmos_db_scaling" {
  count   = var.cosmos_db_scaling_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cosmos DB max scaling reached for collection {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cosmos_db_scaling_message, var.message)
  type    = "query alert"

  # List of available status codes : https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb
  query = <<EOQ
    ${var.cosmos_db_scaling_time_aggregator}(${var.cosmos_db_scaling_timeframe}): default(
      default(sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "429")} by {resource_group,region,name,databasename,collectionname}.as_rate(), 0) /
      default(sum:azure.cosmosdb.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,databasename,collectionname}.as_rate(), 0)
    , 0) * 100 > ${var.cosmos_db_scaling_error_rate_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cosmos_db_scaling_error_rate_threshold_critical
    warning  = var.cosmos_db_scaling_error_rate_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false

  tags = concat(local.common_tags, var.tags, var.cosmos_db_scaling_extra_tags)
}

