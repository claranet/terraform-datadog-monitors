output "age_of_oldest_message_id" {
  description = "id for monitor age_of_oldest_message"
  value       = datadog_monitor.age_of_oldest_message.*.id
}

output "visible_messages_id" {
  description = "id for monitor visible_messages"
  value       = datadog_monitor.visible_messages.*.id
}

