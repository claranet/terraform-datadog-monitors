locals {
  metric_namespace  = { "single" : "dbformysql_servers", "flexible" : "dbformysql_flexibleservers" }[var.server_type]
}
