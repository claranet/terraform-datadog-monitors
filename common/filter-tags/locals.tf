locals {
  including_default_list = "${compact(concat(split(",", format("dd_monitoring:enabled,dd_%s:enabled,env:%s", var.resource, var.environment)), compact(var.extra_tags)))}"
  including_custom_list  = "${compact(concat(split(",", var.filter_tags_custom), compact(var.extra_tags)))}"
  excluding_list         = "${compact(split(",", var.filter_tags_use_defaults == "true" ? join(",", compact(var.extra_tags_excluded)) : join(",", concat(split(",", var.filter_tags_custom_excluded), compact(var.extra_tags_excluded)))))}"

  including_string = "${var.filter_tags_use_defaults == "true" ? join(",", local.including_default_list) : join(",", local.including_custom_list)}"
  excluding_string = "${join(",", local.excluding_list)}"
}
