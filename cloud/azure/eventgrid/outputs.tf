output "eventgrid_no_successful_message_id" {
  description = "id for monitor eventgrid_no_successful_message"
  value       = "${datadog_monitor.eventgrid_no_successful_message.*.id}"
}

output "eventgrid_failed_messages_id" {
  description = "id for monitor eventgrid_failed_messages"
  value       = "${datadog_monitor.eventgrid_failed_messages.*.id}"
}

output "eventgrid_unmatched_events_id" {
  description = "id for monitor eventgrid_unmatched_events"
  value       = "${datadog_monitor.eventgrid_unmatched_events.*.id}"
}
