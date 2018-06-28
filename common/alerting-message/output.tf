output "alerting-message" {
  description = "The generated message string"
  value       = "${data.template_file.alerting-message.rendered}"
}
