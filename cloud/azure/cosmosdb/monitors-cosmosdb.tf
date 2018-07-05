data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_cosmosdb:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "cosmos_db_4xx_requests" {
  name    = "[${var.environment}] Cosmos DB 4xx requests rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cosmos_db_4xx_requests_message, var.message)}"

  query = <<EOF
      sum(last_5m): (default(
        ( avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:400} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:403} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:404} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:408} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:409} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:410} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:412} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:413} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:429} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:449} by {resource_group,name}.as_count() ) /
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered}} by {resource_group,name}.as_count()
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:cosmos_db", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "cosmos_db_5xx_requests" {
  name    = "[${var.environment}] Cosmos DB 5xx requests rate is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cosmos_db_5xx_requests_message, var.message)}"

  query = <<EOF
      sum(last_5m): (default(
        ( avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:500} by {resource_group,name}.as_count() +
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered},statuscode:503} by {resource_group,name}.as_count() ) /
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered}} by {resource_group,name}.as_count()
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
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:cosmos_db", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "cosmos_db_success_no_data" {
  name    = "[${var.environment}] Cosmos DB has no request"
  message = "${coalesce(var.cosmos_db_no_request_message, var.message)}"

  query = <<EOF
      avg(last_5m): (
        avg:azure.cosmosdb.total_requests{${data.template_file.filter.rendered}} by {resource_group,name}
      ) < 0
  EOF

  type = "metric alert"

  silenced = "${var.cosmos_db_no_request_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:cosmos_db", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "cosmos_db_ru_utilization" {
  count = "${length(var.cosmos_db_ru_utilization_collection)}"

  name    = "[${var.environment}] Cosmos DB collection ${element(keys(var.cosmos_db_ru_utilization_collection),count.index)} RU utilization is high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cosmos_db_ru_utilization_message, var.message)}"

  query = <<EOF
      avg(last_5m): (
        avg:azure.cosmosdb.total_request_units{${data.template_file.filter.rendered},collectionname:${element(keys(var.cosmos_db_ru_utilization_collection),count.index)}} by {resource_group,name} /
        ${element(values(var.cosmos_db_ru_utilization_collection),count.index)}
      ) * 100 > ${var.cosmos_db_ru_utilization_rate_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cosmos_db_ru_utilization_rate_threshold_critical}"
    warning  = "${var.cosmos_db_ru_utilization_rate_threshold_warning}"
  }

  silenced = "${var.cosmos_db_ru_utilization_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:cosmos_db", "collection:${element(keys(var.cosmos_db_ru_utilization_collection),count.index)}", "team:azure", "provider:azure"]
}
