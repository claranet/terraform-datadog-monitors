output "ALB_no_healthy_instances_id" {
  description = "id for monitor ALB_no_healthy_instances"
  value       = "${datadog_monitor.ALB_no_healthy_instances.*.id}"
}

output "ALB_latency_id" {
  description = "id for monitor ALB_latency"
  value       = "${datadog_monitor.ALB_latency.*.id}"
}

output "ALB_httpcode_5xx_id" {
  description = "id for monitor ALB_httpcode_5xx"
  value       = "${datadog_monitor.ALB_httpcode_5xx.*.id}"
}

output "ALB_httpcode_4xx_id" {
  description = "id for monitor ALB_httpcode_4xx"
  value       = "${datadog_monitor.ALB_httpcode_4xx.*.id}"
}

output "ALB_httpcode_target_5xx_id" {
  description = "id for monitor ALB_httpcode_target_5xx"
  value       = "${datadog_monitor.ALB_httpcode_target_5xx.*.id}"
}

output "ALB_httpcode_target_4xx_id" {
  description = "id for monitor ALB_httpcode_target_4xx"
  value       = "${datadog_monitor.ALB_httpcode_target_4xx.*.id}"
}
