module "filter-tags" {
  source = "../../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "ingress"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
  extra_tags               = ["!upstream:upstream-default-backend"]
}

module "filter-tags-5xx" {
  source = "../../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "ingress"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
  extra_tags               = ["!upstream:upstream-default-backend,status_code:5xx"]
}
