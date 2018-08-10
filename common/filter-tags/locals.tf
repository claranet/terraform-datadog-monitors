locals {
  filters = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_%s:enabled,env:%s", var.resource, var.environment) : "${var.filter_tags_custom}"}"
}
