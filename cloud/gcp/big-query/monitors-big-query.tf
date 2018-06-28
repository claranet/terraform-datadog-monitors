#
# FILTER
#
data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
              format("project_id:%s", var.project_id) :
             "${var.filter_tags_custom}"}"
  }
}
