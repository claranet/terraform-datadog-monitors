output "app_error_rate_id" {
  description = "id for monitor app_error_rate"
  value       = datadog_monitor.app_error_rate.*.id
}

output "app_apdex_score_id" {
  description = "id for monitor app_apdex_score"
  value       = datadog_monitor.app_apdex_score.*.id
}

output "data_sent_id" {
  description = "id for monitor data_sent"
  value       = datadog_monitor.data_sent.*.id
}

