### RDS Aurora Postgresql Replica Lag monitor ###
resource "datadog_monitor" "rds_aurora_postgresql_replica_lag" {
  name    = "[${var.environment}] RDS Aurora PostgreSQL replica lag {{#is_alert}}{{{comparator}}} {{threshold}} ms ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ms ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.aurora_replicalag_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.aurora_replicalag_timeframe}): (
    avg:aws.rds.rdsto_aurora_postgre_sqlreplica_lag{${data.template_file.filter.rendered}} by {region,name}
  ) > ${var.aurora_replicalag_threshold_critical}
EOF

  thresholds {
    warning  = "${var.aurora_replicalag_threshold_warning}"
    critical = "${var.aurora_replicalag_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.aurora_replicalag_silenced}"

  tags = ["env:${var.environment}", "resource:rds", "team:aws", "provider:aws"]

  count = "${var.aurora_cluster_type == "postgresql" ? 1 : 0}"
}


