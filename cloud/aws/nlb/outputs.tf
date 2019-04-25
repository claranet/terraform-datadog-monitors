output "NLB_no_healthy_instances_id" {
  description = "id for monitor NLB_no_healthy_instances"
  value       = "${datadog_monitor.NLB_no_healthy_instances.*.id}"
}

output "NLB_too_much_reset" {
  description = "id for monitor NLB_too_much_reset"
  value       = "${datadog_monitor.NLB_too_much_reset.*.id}"
}
