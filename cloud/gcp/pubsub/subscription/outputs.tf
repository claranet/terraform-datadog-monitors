output "oldest_unacked_message_age_id" {
  description = "id for monitor oldest_unacked_message_age"
  value       = datadog_monitor.oldest_unacked_message_age.*.id
}

output "subscription_push_latency_id" {
  description = "id for monitor subscription_push_latency"
  value       = datadog_monitor.subscription_push_latency.*.id
}

output "subscription_push_latency_anomaly_id" {
  description = "id for monitor subscription_push_latency_anomaly"
  value       = datadog_monitor.subscription_push_latency_anomaly.*.id
}

