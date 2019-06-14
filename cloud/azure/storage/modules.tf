module "filter-tags" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all"]
}

module "filter-tags-success" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:success"]
}

module "filter-tags-timeout-error" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:ServerTimeoutError"]
}

module "filter-tags-network-error" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:NetworkError"]
}

module "filter-tags-throttling-error" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:ServerBusyError"]
}

module "filter-tags-server-other-error" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:ServerOtherError"]
}

module "filter-tags-client-other-error" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:ClientOtherError"]
}

module "filter-tags-authorization-error" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_storage"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["transaction_type:all,responsetype:AuthorizationError"]
}
