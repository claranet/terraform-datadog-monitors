output "Nginx_ingress_too_many_5xx_id" {
  description = "id for monitor Nginx_ingress_too_many_5xx"
  value       = "${datadog_monitor.Nginx_ingress_too_many_5xx.*.id}"
}
