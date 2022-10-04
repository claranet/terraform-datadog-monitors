module "filter-tags" {
  source = "../../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "aws_elasticache"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
}

