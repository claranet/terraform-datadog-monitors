data "template_file" "filter_metric" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
            format("dd_monitoring:enabled,dd_%s_%s:enabled,env:%s", var.provider, var.resource_kind, var.environment) :
            "${var.filter_tags_custom}"}"
  }
}

data "template_file" "filter_query" {
  template = "\"$${filter}\""

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
            format("dd_monitoring:enabled,dd_%s_%s:enabled,env:%s", var.provider, var.resource_kind, var.environment) :
            "${var.filter_tags_custom}"}"
  }
}
