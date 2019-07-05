output "azure_search_latency_id" {
  description = "id for monitor azure_search_latency"
  value       = datadog_monitor.azure_search_latency.*.id
}

output "azure_search_throttled_queries_rate_id" {
  description = "id for monitor azure_search_throttled_queries_rate"
  value       = datadog_monitor.azure_search_throttled_queries_rate.*.id
}

