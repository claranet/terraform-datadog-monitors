output "es_cluster_status_id" {
  description = "id for monitor es_cluster_status"
  value       = "${datadog_monitor.es_cluster_status.*.id}"
}

output "es_free_space_low_id" {
  description = "id for monitor es_free_space_low"
  value       = "${datadog_monitor.es_free_space_low.*.id}"
}

output "es_cpu_90_15min_id" {
  description = "id for monitor es_cpu_90_15min"
  value       = "${datadog_monitor.es_cpu_90_15min.*.id}"
}
