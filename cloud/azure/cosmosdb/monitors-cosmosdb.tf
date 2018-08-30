resource "datadog_monitor" "cosmos_db_status" {
  count = "${var.status_enabled ? 1 : 0}"

  name    = "[${var.environment}] Cosmos DB is down"
  message = "${coalesce(var.status_message, var.message)}"

  query = <<EOF
      ${var.status_time_aggregator}(${var.status_timeframe}):(
        avg:azure.cosmosdb.status${module.filter-tags.query_alert} by {resource_group,region,name} +
        avg:azure.documentdb_databaseaccounts.status${module.filter-tags.query_alert} by {resource_group,region,name})
      < 1
  EOF

  type = "metric alert"

  thresholds {
    critical = 1
  }

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

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:cosmos_db", "team:claranet", "created-by:terraform", "${var.status_extra_tags}"]
}

resource "datadog_monitor" "cosmos_db_4xx_requests" {
  count = "${var.cosmos_db_4xx_requests_enabled ? 1 : 0}"

  name    = "[${var.environment}] Cosmos DB 4xx requests rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cosmos_db_4xx_requests_message, var.message)}"

  # List of available status codes : https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb
  query = <<EOF
      ${var.cosmos_db_4xx_request_time_aggregator}(${var.cosmos_db_4xx_request_timeframe}): (default(
        (
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "400")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "401")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "403")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "404")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "408")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "409")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "412")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "413")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "429")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "449")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "400")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "401")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "403")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "404")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "408")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "409")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "412")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "413")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "429")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "449")} by {resource_group,region,name,collectionname}.as_count()
        ) / (
          sum:azure.cosmosdb.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_count()
        )
        * 100, 0)
      ) > ${var.cosmos_db_4xx_request_rate_threshold_critical}
      EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cosmos_db_4xx_request_rate_threshold_critical}"
    warning  = "${var.cosmos_db_4xx_request_rate_threshold_warning}"
  }

  silenced = "${var.cosmos_db_4xx_requests_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:cosmos_db", "team:claranet", "created-by:terraform", "${var.cosmos_db_4xx_request_extra_tags}"]
}

resource "datadog_monitor" "cosmos_db_5xx_requests" {
  count = "${var.cosmos_db_5xx_requests_enabled ? 1 : 0}"

  name    = "[${var.environment}] Cosmos DB 5xx requests rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cosmos_db_5xx_requests_message, var.message)}"

  query = <<EOF
      ${var.cosmos_db_5xx_request_time_aggregator}(${var.cosmos_db_5xx_request_timeframe}): (default(
        (
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "500")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "503")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "500")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "503")} by {resource_group,region,name,collectionname}.as_count()
        ) / (
          sum:azure.cosmosdb.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_count()
        )
        * 100, 0)
      ) > ${var.cosmos_db_5xx_request_rate_threshold_critical}
      EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cosmos_db_5xx_request_rate_threshold_critical}"
    warning  = "${var.cosmos_db_5xx_request_rate_threshold_warning}"
  }

  silenced = "${var.cosmos_db_5xx_requests_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:cosmos_db", "team:claranet", "created-by:terraform", "${var.cosmos_db_5xx_request_rate_extra_tags}"]
}

resource "datadog_monitor" "cosmos_db_scaling" {
  count = "${var.cosmos_db_scaling_enabled ? 1 : 0}"

  name    = "[${var.environment}] Cosmos DB max scaling reached for collection {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cosmos_db_scaling_message, var.message)}"

  # List of available status codes : https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb
  query = <<EOF
      ${var.cosmos_db_scaling_time_aggregator}(${var.cosmos_db_scaling_timeframe}): (default(
        (
          sum:azure.cosmosdb.total_requests${format(module.filter-tags-statuscode.query_alert, "429")} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${format(module.filter-tags-statuscode.query_alert, "429")} by {resource_group,region,name,collectionname}.as_count()
        ) / (
          sum:azure.cosmosdb.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_count() +
          sum:azure.documentdb_databaseaccounts.total_requests${module.filter-tags.query_alert} by {resource_group,region,name,collectionname}.as_count()
        )
        * 100, 0)
      ) > ${var.cosmos_db_scaling_error_rate_threshold_critical}
      EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cosmos_db_scaling_error_rate_threshold_critical}"
    warning  = "${var.cosmos_db_scaling_error_rate_threshold_warning}"
  }

  silenced = "${var.cosmos_db_scaling_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:cosmos_db", "team:claranet", "created-by:terraform", "${var.cosmos_db_scaling_extra_tags}"]
}
