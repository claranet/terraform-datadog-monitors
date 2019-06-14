output "storage_status_id" {
  description = "id for monitor storage_status"
  value       = "${datadog_monitor.storage_status.*.id}"
}

output "blobservices_availability_id" {
  description = "id for monitor blobservices_availability"
  value       = "${datadog_monitor.blobservices_availability.*.id}"
}

output "fileservices_availability_id" {
  description = "id for monitor fileservices_availability"
  value       = "${datadog_monitor.fileservices_availability.*.id}"
}

output "queueservices_availability_id" {
  description = "id for monitor queueservices_availability"
  value       = "${datadog_monitor.queueservices_availability.*.id}"
}

output "table_availability_id" {
  description = "id for monitor table_availability"
  value       = "${datadog_monitor.table_availability.*.id}"
}

output "blobservices_requests_error_id" {
  description = "id for monitor blobservices_requests_error"
  value       = "${datadog_monitor.blobservices_requests_error.*.id}"
}

output "fileservices_requests_error_id" {
  description = "id for monitor fileservices_requests_error"
  value       = "${datadog_monitor.fileservices_requests_error.*.id}"
}

output "queueservices_requests_error_id" {
  description = "id for monitor queueservices_requests_error"
  value       = "${datadog_monitor.queueservices_requests_error.*.id}"
}

output "tableservices_requests_error_id" {
  description = "id for monitor tableservices_requests_error"
  value       = "${datadog_monitor.tableservices_requests_error.*.id}"
}

output "blobservices_latency_id" {
  description = "id for monitor blobservices_latency"
  value       = "${datadog_monitor.blobservices_latency.*.id}"
}

output "fileservices_latency_id" {
  description = "id for monitor fileservices_latency"
  value       = "${datadog_monitor.fileservices_latency.*.id}"
}

output "queueservices_latency_id" {
  description = "id for monitor queueservices_latency"
  value       = "${datadog_monitor.queueservices_latency.*.id}"
}

output "tableservices_latency_id" {
  description = "id for monitor tableservices_latency"
  value       = "${datadog_monitor.tableservices_latency.*.id}"
}

output "blob_timeout_error_requests_id" {
  description = "id for monitor blob_timeout_error_requests"
  value       = "${datadog_monitor.blob_timeout_error_requests.*.id}"
}

output "file_timeout_error_requests_id" {
  description = "id for monitor file_timeout_error_requests"
  value       = "${datadog_monitor.file_timeout_error_requests.*.id}"
}

output "queue_timeout_error_requests_id" {
  description = "id for monitor queue_timeout_error_requests"
  value       = "${datadog_monitor.queue_timeout_error_requests.*.id}"
}

output "table_timeout_error_requests_id" {
  description = "id for monitor table_timeout_error_requests"
  value       = "${datadog_monitor.table_timeout_error_requests.*.id}"
}

output "blob_network_error_requests_id" {
  description = "id for monitor blob_network_error_requests"
  value       = "${datadog_monitor.blob_network_error_requests.*.id}"
}

output "file_network_error_requests_id" {
  description = "id for monitor file_network_error_requests"
  value       = "${datadog_monitor.file_network_error_requests.*.id}"
}

output "queue_network_error_requests_id" {
  description = "id for monitor queue_network_error_requests"
  value       = "${datadog_monitor.queue_network_error_requests.*.id}"
}

output "table_network_error_requests_id" {
  description = "id for monitor table_network_error_requests"
  value       = "${datadog_monitor.table_network_error_requests.*.id}"
}

output "blob_throttling_error_requests_id" {
  description = "id for monitor blob_throttling_error_requests"
  value       = "${datadog_monitor.blob_throttling_error_requests.*.id}"
}

output "file_throttling_error_requests_id" {
  description = "id for monitor file_throttling_error_requests"
  value       = "${datadog_monitor.file_throttling_error_requests.*.id}"
}

output "queue_throttling_error_requests_id" {
  description = "id for monitor queue_throttling_error_requests"
  value       = "${datadog_monitor.queue_throttling_error_requests.*.id}"
}

output "table_throttling_error_requests_id" {
  description = "id for monitor table_throttling_error_requests"
  value       = "${datadog_monitor.table_throttling_error_requests.*.id}"
}

output "blob_server_other_error_requests_id" {
  description = "id for monitor blob_server_other_error_requests"
  value       = "${datadog_monitor.blob_server_other_error_requests.*.id}"
}

output "file_server_other_error_requests_id" {
  description = "id for monitor file_server_other_error_requests"
  value       = "${datadog_monitor.file_server_other_error_requests.*.id}"
}

output "queue_server_other_error_requests_id" {
  description = "id for monitor queue_server_other_error_requests"
  value       = "${datadog_monitor.queue_server_other_error_requests.*.id}"
}

output "table_server_other_error_requests_id" {
  description = "id for monitor table_server_other_error_requests"
  value       = "${datadog_monitor.table_server_other_error_requests.*.id}"
}

output "blob_client_other_error_requests_id" {
  description = "id for monitor blob_client_other_error_requests"
  value       = "${datadog_monitor.blob_client_other_error_requests.*.id}"
}

output "file_client_other_error_requests_id" {
  description = "id for monitor file_client_other_error_requests"
  value       = "${datadog_monitor.file_client_other_error_requests.*.id}"
}

output "queue_client_other_error_requests_id" {
  description = "id for monitor queue_client_other_error_requests"
  value       = "${datadog_monitor.queue_client_other_error_requests.*.id}"
}

output "table_client_other_error_requests_id" {
  description = "id for monitor table_client_other_error_requests"
  value       = "${datadog_monitor.table_client_other_error_requests.*.id}"
}

output "blob_authorization_error_requests_id" {
  description = "id for monitor blob_authorization_error_requests"
  value       = "${datadog_monitor.blob_authorization_error_requests.*.id}"
}

output "file_authorization_error_requests_id" {
  description = "id for monitor file_authorization_error_requests"
  value       = "${datadog_monitor.file_authorization_error_requests.*.id}"
}

output "queue_authorization_error_requests_id" {
  description = "id for monitor queue_authorization_error_requests"
  value       = "${datadog_monitor.queue_authorization_error_requests.*.id}"
}

output "table_authorization_error_requests_id" {
  description = "id for monitor table_authorization_error_requests"
  value       = "${datadog_monitor.table_authorization_error_requests.*.id}"
}
