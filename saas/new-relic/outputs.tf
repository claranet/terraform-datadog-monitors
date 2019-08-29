output "app_apdex_score_id" {
  description = "id for monitor app_apdex_score"
  value       = datadog_monitor.app_apdex_score.*.id
}

output "app_error_rate_id" {
  description = "id for monitor app_error_rate"
  value       = datadog_monitor.app_error_rate.*.id
}

