output "value" {
  value = "${data.template_file.filter.rendered}"
}
