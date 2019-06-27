### RDS Aurora Postgresql Replica Lag monitor ###
resource "datadog_monitor" "rds_aurora_postgresql_replica_lag" {
  count   = var.aurora_replicalag_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS Aurora PostgreSQL replica lag {{#is_alert}}{{{comparator}}} {{threshold}} ms ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ms ({{value}}%){{/is_warning}}"
  message = coalesce(var.aurora_replicalag_message, var.message)
  type    = "query alert"

  query = <<EOQ
  avg(${var.aurora_replicalag_timeframe}): (
    avg:aws.rds.rdsto_aurora_postgre_sqlreplica_lag${module.filter-tags.query_alert} by {region,name}
  ) > ${var.aurora_replicalag_threshold_critical}
EOQ

  thresholds = {
    warning = var.aurora_replicalag_threshold_warning
    critical = var.aurora_replicalag_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = true
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:rds-aurora-postgresql", "team:claranet", "created-by:terraform"], var.aurora_replicalag_extra_tags)
}

