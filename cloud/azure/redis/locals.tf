locals {
  metric_namespace = { "cache" : "cache_redis", "managed" : "cache_redisenterprise" }[var.server_type]
}
