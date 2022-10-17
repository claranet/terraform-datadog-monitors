module "filter-tags" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "velero"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
}

module "filter-tags-scheduled-backup" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "velero"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
  extra_tags_excluded         = ["schedule:"]
}

module "monitor-tags" {
  source = "../../../common/monitor-tags"

  environment = var.environment
  extra_tags  = var.extra_tags
}
