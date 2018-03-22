data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_es:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

### Elasticsearch cluster status monitor ###
resource "datadog_monitor" "es_cluster_status" {
  name    = "[${var.environment}] ElasticSearch cluster status is not green"
  message = "${var.message}"

  type = "query alert"

  query = <<EOF
  max(last_30m): (
    avg:aws.es.cluster_statusred{${data.template_file.filter.rendered}} by {region,name} * 2 +
    avg:aws.es.cluster_statusyel{${data.template_file.filter.rendered}} by {region,name}
  ) > 2
EOF

  thresholds {
    ok       = 0
    warning  = 1
    critical = 2
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elasticsearch", "team:aws", "provider:aws"]
}

### Elasticsearch cluster free storage space monitor ###
resource "datadog_monitor" "es_free_space_low" {
  name    = "[${var.environment}] ElasticSearch cluster free storage space {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  type = "query alert"

  query = <<EOF
  avg(last_15m): (
    avg:aws.es.free_storage_space{${data.template_file.filter.rendered}} by {region,name} /
    (${var.es_cluster_volume_size}*1000) * 100
  ) < ${var.diskspace_threshold_critical}
EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elasticsearch", "team:aws", "provider:aws"]
}

### Elasticsearch cluster CPU monitor ###
resource "datadog_monitor" "es_cpu_90_15min" {
  name    = "[${var.environment}] ElasticSearch cluster CPU high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  type = "query alert"

  query = <<EOF
  avg(last_15m): (
    avg:aws.es.cpuutilization{${data.template_file.filter.rendered}} by {region,name}
  ) > ${var.cpu_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elasticsearch", "team:aws", "provider:aws"]
}
