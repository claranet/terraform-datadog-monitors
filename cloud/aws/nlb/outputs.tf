output "NLB_no_healthy_instances_id" {
  description = "id for monitor NLB_no_healthy_instances"
  value       = datadog_monitor.NLB_no_healthy_instances.*.id
}

