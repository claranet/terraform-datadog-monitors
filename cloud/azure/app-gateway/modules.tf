module "filter-tags" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "azure_app-gateway"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
}

module "filter-tags-4xx-error" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "azure_app-gateway"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags                  = ["httpstatusgroup:4xx"]
}

module "filter-tags-5xx-error" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "azure_app-gateway"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags                  = ["httpstatusgroup:5xx"]
}

module "filter-tags-backend-4xx-error" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "azure_app-gateway"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags                  = ["httpstatusgroup:4xx"]
}

module "filter-tags-backend-5xx-error" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "azure_app-gateway"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags                  = ["httpstatusgroup:5xx"]
}
