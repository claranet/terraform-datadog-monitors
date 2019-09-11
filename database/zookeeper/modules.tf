module "filter-tags" {
  source = "../../common/filter-tags"

  environment                 = var.environment
  resource                    = "zookeeper"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
}

module "filter-tags-check-process" {
  source = "../../common/filter-tags"

  environment                 = var.environment
  resource                    = "zookeeper"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags                  = ["dd_process_name:zookeeper"]
}
