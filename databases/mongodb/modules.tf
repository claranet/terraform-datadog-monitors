module "filter-tags" {
  source = "../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "mongodb"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
}

module "filter-tags-secondary" {
  source = "../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "mongodb"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
  extra_tags               = ["replset_state:secondary"]
}
