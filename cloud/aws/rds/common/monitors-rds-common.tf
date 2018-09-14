data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_rds:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

### RDS instance CPU monitor ###
resource "datadog_monitor" "rds_cpu_90_15min" {
  name    = "[${var.environment}] RDS instance CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    avg(${var.cpu_timeframe}): (
      avg:aws.rds.cpuutilization{${data.template_file.filter.rendered}} by {region,name}
    ) > ${var.cpu_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.cpu_silenced}"

  tags = ["env:${var.environment}", "resource:rds", "team:aws", "provider:aws"]
}

### RDS instance free space monitor ###
resource "datadog_monitor" "rds_free_space_low" {
  name    = "[${var.environment}] RDS instance free space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.diskspace_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.diskspace_timeframe}): (
    avg:aws.rds.free_storage_space{${data.template_file.filter.rendered}} by {region,name} /
    avg:aws.rds.total_storage_space{${data.template_file.filter.rendered}} by {region,name} * 100
  ) < ${var.diskspace_threshold_critical}
EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.diskspace_silenced}"

  tags = ["env:${var.environment}", "resource:rds", "team:aws", "provider:aws"]

  count = "${var.aurora_cluster_type == "" ? 1 : 0}"
}

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

### RDS Aurora Mysql Replica Lag monitor ###
resource "datadog_monitor" "rds_aurora_mysql_replica_lag" {
  name    = "[${var.environment}] RDS Aurora Mysql replica lag {{#is_alert}}{{{comparator}}} {{threshold}} ms ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ms ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.aurora_replicalag_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.aurora_replicalag_timeframe}): (
    avg:aws.rds.aws.rds.aurora_replica_lag{${data.template_file.filter.rendered}} by {region,name}
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

  count = "${var.aurora_cluster_type == "mysql" ? 1 : 0}"
}
