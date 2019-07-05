output "nginx_ingress_too_many_5xx_id" {
  description = "id for monitor nginx_ingress_too_many_5xx"
  value       = datadog_monitor.nginx_ingress_too_many_5xx.*.id
}

output "nginx_ingress_too_many_4xx_id" {
  description = "id for monitor nginx_ingress_too_many_4xx"
  value       = datadog_monitor.nginx_ingress_too_many_4xx.*.id
}

