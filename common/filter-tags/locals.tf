locals {
  filters = "${var.filter_tags_use_defaults == "true" ? join(",", compact(concat(split(",", format("dd_monitoring:enabled,dd_%s:enabled,env:%s", var.resource, var.environment)), compact(var.extra_tags)))) : "${var.filter_tags_custom}"}"
}
