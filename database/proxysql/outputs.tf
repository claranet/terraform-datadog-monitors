output "proxysql_client_conn_aborted_id" {
  description = "id for monitor proxysql_client_conn_aborted"
  value       = datadog_monitor.proxysql_client_conn_aborted.*.id
}

output "proxysql_pool_conn_failure_id" {
  description = "id for monitor proxysql_pool_conn_failure"
  value       = datadog_monitor.proxysql_pool_conn_failure.*.id
}

output "proxysql_server_conn_aborted_id" {
  description = "id for monitor proxysql_server_conn_aborted"
  value       = datadog_monitor.proxysql_server_conn_aborted.*.id
}

output "proxysql_slow_id" {
  description = "id for monitor proxysql_slow"
  value       = datadog_monitor.proxysql_slow.*.id
}

output "proxysql_thread_worker_id" {
  description = "id for monitor proxysql_thread_worker"
  value       = datadog_monitor.proxysql_thread_worker.*.id
}

