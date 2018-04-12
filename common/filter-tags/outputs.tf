output "value_metric" {
  value = "${data.template_file.filter_metric.rendered}"
}

output "value_query" {
  value = "${data.template_file.filter_query.rendered}"
}
