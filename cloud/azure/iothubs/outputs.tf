output "too_many_jobs_failed_id" {
  description = "id for monitor too_many_jobs_failed"
  value       = "${datadog_monitor.too_many_jobs_failed.*.id}"
}

output "too_many_list_jobs_failed_id" {
  description = "id for monitor too_many_list_jobs_failed"
  value       = "${datadog_monitor.too_many_list_jobs_failed.*.id}"
}

output "too_many_query_jobs_failed_id" {
  description = "id for monitor too_many_query_jobs_failed"
  value       = "${datadog_monitor.too_many_query_jobs_failed.*.id}"
}

output "status_id" {
  description = "id for monitor status"
  value       = "${datadog_monitor.status.*.id}"
}

output "total_devices_id" {
  description = "id for monitor total_devices"
  value       = "${datadog_monitor.total_devices.*.id}"
}

output "too_many_c2d_methods_failed_id" {
  description = "id for monitor too_many_c2d_methods_failed"
  value       = "${datadog_monitor.too_many_c2d_methods_failed.*.id}"
}

output "too_many_c2d_twin_read_failed_id" {
  description = "id for monitor too_many_c2d_twin_read_failed"
  value       = "${datadog_monitor.too_many_c2d_twin_read_failed.*.id}"
}

output "too_many_c2d_twin_update_failed_id" {
  description = "id for monitor too_many_c2d_twin_update_failed"
  value       = "${datadog_monitor.too_many_c2d_twin_update_failed.*.id}"
}

output "too_many_d2c_twin_read_failed_id" {
  description = "id for monitor too_many_d2c_twin_read_failed"
  value       = "${datadog_monitor.too_many_d2c_twin_read_failed.*.id}"
}

output "too_many_d2c_twin_update_failed_id" {
  description = "id for monitor too_many_d2c_twin_update_failed"
  value       = "${datadog_monitor.too_many_d2c_twin_update_failed.*.id}"
}

output "too_many_d2c_telemetry_egress_dropped_id" {
  description = "id for monitor too_many_d2c_telemetry_egress_dropped"
  value       = "${datadog_monitor.too_many_d2c_telemetry_egress_dropped.*.id}"
}

output "too_many_d2c_telemetry_egress_orphaned_id" {
  description = "id for monitor too_many_d2c_telemetry_egress_orphaned"
  value       = "${datadog_monitor.too_many_d2c_telemetry_egress_orphaned.*.id}"
}

output "too_many_d2c_telemetry_egress_invalid_id" {
  description = "id for monitor too_many_d2c_telemetry_egress_invalid"
  value       = "${datadog_monitor.too_many_d2c_telemetry_egress_invalid.*.id}"
}

output "too_many_d2c_telemetry_ingress_nosent_id" {
  description = "id for monitor too_many_d2c_telemetry_ingress_nosent"
  value       = "${datadog_monitor.too_many_d2c_telemetry_ingress_nosent.*.id}"
}
