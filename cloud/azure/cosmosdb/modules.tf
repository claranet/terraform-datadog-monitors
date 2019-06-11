module "filter-tags" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_cosmosdb"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
}

module "filter-tags-statuscode" {
  source = "../../../common/filter-tags"

  environment                 = "${var.environment}"
  resource                    = "azure_cosmosdb"
  filter_tags_use_defaults    = "${var.filter_tags_use_defaults}"
  filter_tags_custom          = "${var.filter_tags_custom}"
  filter_tags_custom_excluded = "${var.filter_tags_custom_excluded}"
  extra_tags                  = ["statuscode:%s"]
}
