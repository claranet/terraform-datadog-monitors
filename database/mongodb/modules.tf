module "filter-tags" {
  #source = "../../common/filter-tags"
  source = "/Users/dj/Documents/code/kering/datadog/terraform-datadog-monitors/common/filter-tags"

  environment                 = var.environment
  resource                    = "mongodb"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
}

module "filter-tags-secondary" {
  #source = "../../common/filter-tags"

  source = "/Users/dj/Documents/code/kering/datadog/terraform-datadog-monitors/common/filter-tags"

  environment                 = var.environment
  resource                    = "mongodb"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags                  = ["replset_state:secondary"]
  filter_tags_separator       = var.filter_tags_separator
}

