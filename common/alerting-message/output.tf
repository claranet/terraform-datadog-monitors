output "alerting-message" {
  value = "${data.template_file.alerting-message.rendered}"
}
