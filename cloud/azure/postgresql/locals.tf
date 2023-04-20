locals {
  metric_namespace = { "single" : "dbforpostgresql_servers", "flexible" : "dbforpostgresql_flexibleservers" }[var.server_type]
}
