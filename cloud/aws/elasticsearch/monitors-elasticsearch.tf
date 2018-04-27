data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_es:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

### Elasticsearch cluster status monitor ###
/* Note about the query
    - If aws.es.cluster_statusred is 1 --> query value (= 2.1) > 2 : critical
    - If aws.es.cluster_statusyellow is 1 --> 1 < query value (=1.1) < 2 : warning
    Workaround : in the query, we add "0.1" to the result and we use the comparator ">=". No alert was triggered without that. */
resource "datadog_monitor" "es_cluster_status" {
  name    = "[${var.environment}] ElasticSearch cluster status is not green"
  message = "${coalesce(var.es_cluster_status_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.es_cluster_status_aggregator}(${var.es_cluster_status_timeframe}): (
    ${var.es_cluster_status_aggregator}:aws.es.cluster_statusred{${data.template_file.filter.rendered}} by {region,name} * 2 +
    (${var.es_cluster_status_aggregator}:aws.es.cluster_statusyellow{${data.template_file.filter.rendered}} by {region,name} + 0.1)
  ) >= 2
EOF

  thresholds {
    warning  = 1
    critical = 2
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.es_cluster_status_silenced}"

  tags = ["env:${var.environment}", "resource:elasticsearch", "team:aws", "provider:aws"]
}

### Elasticsearch cluster free storage space monitor ###
resource "datadog_monitor" "es_free_space_low" {
  name    = "[${var.environment}] ElasticSearch cluster free storage space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.diskspace_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.diskspace_aggregator}(${var.diskspace_timeframe}): (
    ${var.diskspace_aggregator}:aws.es.free_storage_space{${data.template_file.filter.rendered}} by {region,name} /
    (${var.es_cluster_volume_size}*1000) * 100
  ) < ${var.diskspace_threshold_critical}
EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.diskspace_silenced}"

  tags = ["env:${var.environment}", "resource:elasticsearch", "team:aws", "provider:aws"]
}

### Elasticsearch cluster CPU monitor ###
resource "datadog_monitor" "es_cpu_90_15min" {
  name    = "[${var.environment}] ElasticSearch cluster CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.cpu_aggregator}(${var.cpu_timeframe}): (
    ${var.cpu_aggregator}:aws.es.cpuutilization{${data.template_file.filter.rendered}} by {region,name}
  ) > ${var.cpu_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.cpu_silenced}"

  tags = ["env:${var.environment}", "resource:elasticsearch", "team:aws", "provider:aws"]
}
