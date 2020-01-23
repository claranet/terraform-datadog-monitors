output "not_responding_id" {
  description = "id for monitor not_responding"
  value       = datadog_monitor.not_responding.*.id
}

output "search_handler_errors_id" {
  description = "id for monitor search_handler_errors"
  value       = datadog_monitor.search_handler_errors.*.id
}

output "searcher_warmup_time_id" {
  description = "id for monitor searcher_warmup_time"
  value       = datadog_monitor.searcher_warmup_time.*.id
}

