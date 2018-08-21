module "filter-tags" {
  source = "../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "system"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
}

module "filter-tags-disk" {
  source = "../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "system"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
  extra_tags               = ["dd_disk:enabled"]
}
