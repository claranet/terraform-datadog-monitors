module "filter-tags" {
  source = "../../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "ingress"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
  extra_tags_excluded         = ["upstream:upstream-default-backend"]
}

module "filter-tags-5xx" {
  source = "../../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "ingress"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
  extra_tags                  = ["status_code:5xx"]
  extra_tags_excluded         = ["upstream:upstream-default-backend"]
}

module "filter-tags-4xx" {
  source = "../../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "ingress"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  filter_tags_separator       = var.filter_tags_separator
  extra_tags                  = ["status_code:4xx"]
  extra_tags_excluded         = ["upstream:upstream-default-backend"]
}

module "monitor-tags" {
  source = "../../../../common/monitor-tags"

  environment = var.environment
  extra_tags  = var.extra_tags
}
