output "cannot_connect_id" {
  description = "id for monitor cannot_connect"
  value       = datadog_monitor.cannot_connect.*.id
}

output "invalid_tls_certificate_id" {
  description = "id for monitor invalid_tls_certificate"
  value       = datadog_monitor.invalid_tls_certificate.*.id
}

output "tls_certificate_expiration_id" {
  description = "id for monitor tls_certificate_expiration"
  value       = datadog_monitor.tls_certificate_expiration.*.id
}

output "certificate_expiration_date_id" {
  description = "id for monitor certificate_expiration_date"
  value       = datadog_monitor.certificate_expiration_date.*.id
}

