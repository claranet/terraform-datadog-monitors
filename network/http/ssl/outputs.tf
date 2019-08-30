output "certificate_expiration_date_id" {
  description = "id for monitor certificate_expiration_date"
  value       = datadog_monitor.certificate_expiration_date.*.id
}

output "invalid_ssl_certificate_id" {
  description = "id for monitor invalid_ssl_certificate"
  value       = datadog_monitor.invalid_ssl_certificate.*.id
}

