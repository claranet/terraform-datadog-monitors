data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
            format("dd_monitoring:enabled,dd_azure_%s:enabled,env:%s", var.resource_name, var.environment) :
            "${var.filter_tags_custom}"}"
  }
}
