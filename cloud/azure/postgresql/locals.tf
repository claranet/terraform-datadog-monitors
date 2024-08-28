locals {
  metric_namespace              = { "single" : "dbforpostgresql_servers", "flexible" : "dbforpostgresql_flexibleservers" }[var.server_type]
  metric_io_consumption_percent = { "single" : "io_consumption_percent", "flexible" : "disk_iops_consumed_percentage" }[var.server_type]
}
