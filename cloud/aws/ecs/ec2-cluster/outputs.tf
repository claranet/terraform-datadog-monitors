output "cluster_cpu_utilization_id" {
  description = "id for monitor cluster_cpu_utilization"
  value       = datadog_monitor.cluster_cpu_utilization.*.id
}

output "cluster_memory_reservation_id" {
  description = "id for monitor cluster_memory_reservation"
  value       = datadog_monitor.cluster_memory_reservation.*.id
}

output "ecs_agent_status_id" {
  description = "id for monitor ecs_agent_status"
  value       = datadog_monitor.ecs_agent_status.*.id
}

