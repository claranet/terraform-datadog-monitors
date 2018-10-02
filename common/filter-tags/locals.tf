locals {
  including_default_list = "${compact(concat(split(",", format("dd_monitoring:enabled,dd_%s:enabled,env:%s", var.resource, var.environment)), compact(var.extra_tags)))}"
  excluding_list         = "${compact(split(",", var.filter_tags_use_defaults == "true" ? "" : join(",", split(",", "${var.filter_tags_custom_excluded}"))))}"

  including_string = "${var.filter_tags_use_defaults == "true" ? join(",", local.including_default_list) : "${var.filter_tags_custom}"}"
  excluding_string = "${join(",", local.excluding_list)}"
}
