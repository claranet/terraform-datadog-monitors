resource "datadog_monitor" "memcached_get_hits" {
  count   = "${var.get_hits_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Elasticache memcached cache hit ratio {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.get_hits_message, var.message)}"

  type = "metric alert"

  query = <<EOQ
    ${var.get_hits_time_aggregator}(${var.get_hits_timeframe}): (
      default(avg:aws.elasticache.get_hits${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_rate(), 0) / (
        default(avg:aws.elasticache.get_hits${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_rate(), 0) +
        default(avg:aws.elasticache.get_misses${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}.as_rate(), 0))
    ) * 100 < ${var.get_hits_threshold_critical}
  EOQ

  thresholds {
    warning  = "${var.get_hits_threshold_warning}"
    critical = "${var.get_hits_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.get_hits_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache-memcached", "team:claranet", "created-by:terraform", "engine:memcached", "${var.get_hits_extra_tags}"]
}

resource "datadog_monitor" "memcached_cpu_high" {
  count   = "${var.cpu_high_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Elasticache memcached CPU {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  type = "metric alert"

  query = <<EOQ
    ${var.cpu_high_time_aggregator}(${var.cpu_high_timeframe}): (
      avg:aws.elasticache.cpuutilization${module.filter-tags.query_alert} by {region,cacheclusterid,cachenodeid}
    ) > ${var.cpu_high_threshold_critical}
  EOQ

  thresholds {
    warning  = "${var.cpu_high_threshold_warning}"
    critical = "${var.cpu_high_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.cpu_high_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:elasticache-memcached", "team:claranet", "created-by:terraform", "engine:memcached", "${var.cpu_high_extra_tags}"]
}
