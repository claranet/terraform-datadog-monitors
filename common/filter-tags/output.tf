output "query_alert" {
  description = "The full filtering pattern including parentheses for service check monitor type"
  value       = "{${local.filters}}"
}

output "service_check" {
  description = "The full filtering pattern including braces for query alert monitor type"
  value       = "(\"${replace(local.filters, ",", "\",\"")}\")"
}

