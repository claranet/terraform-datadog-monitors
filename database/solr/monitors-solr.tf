#
# Service Check
#

resource "datadog_monitor" "not_responding" {
  count   = var.not_responding_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Solr does not respond {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.not_responding_message, var.message)
  type    = "service check"

  query = <<EOQ
    "solr.can_connect"${module.filter-tags.service_check}.by(${join(",", formatlist("\"%s\"", var.not_responding_group_by))}).last(6).count_by_status()

EOQ

  monitor_thresholds {
    warning  = var.not_responding_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.not_responding_no_data_timeframe
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:database", "provider:solr", "resource:solr", "team:claranet", "created-by:terraform"], var.not_responding_extra_tags)

}

#
# Handler errors
#

resource "datadog_monitor" "search_handler_errors" {
  count   = var.search_handler_errors_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Too many errors on Solr search handler {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.search_handler_errors_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.search_handler_errors_time_aggregator}(${var.search_handler_errors_timeframe}):
    default(sum:solr.search_handler.errors${module.filter-tags.query_alert} by {${join(",", var.search_handler_errors_group_by)}}.as_rate(), 0) / default(sum:solr.search_handler.requests${module.filter-tags.query_alert} by {${join(",", var.search_handler_errors_group_by)}}.as_rate(), 1) * 100
    > ${var.search_handler_errors_rate_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.search_handler_errors_rate_threshold_warning
    critical = var.search_handler_errors_rate_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:solr", "resource:solr", "team:claranet", "created-by:terraform"], var.search_handler_errors_extra_tags)

}

#
# Solr Warmup time
#

resource "datadog_monitor" "searcher_warmup_time" {
  count   = var.searcher_warmup_time_enabled ? 1 : 0
  message = coalesce(var.searcher_warmup_time_message, var.message)
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Solr searcher warmup time too high  {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  type    = "metric alert"
  query   = <<EOQ
  ${var.searcher_warmup_time_aggregator}(${var.searcher_warmup_time_timeframe}):
    min:solr.searcher.warmup${module.filter-tags.query_alert} by {${join(",", var.searcher_warmup_time_group_by)}}
    >= ${var.searcher_warmup_time_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.searcher_warmup_time_threshold_warning
    critical = var.searcher_warmup_time_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  include_tags        = true
  require_full_window = true
  notify_no_data      = false

  tags = concat(["env:${var.environment}", "type:database", "provider:solr", "resource:solr", "team:claranet", "created-by:terraform"], var.searcher_warmup_time_extra_tags)
}
