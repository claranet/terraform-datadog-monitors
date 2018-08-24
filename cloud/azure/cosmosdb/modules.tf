module "filter-tags" {
  source = "../../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "cosmosdb"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom}"
}

module "filter-tags-statuscode" {
  source = "../../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "cosmosdb"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom},statuscode:%s"

  extra_tags = ["statuscode:%s"]
}

module "filter-tags-collection" {
  source = "../../../common/filter-tags"

  environment              = "${var.environment}"
  resource                 = "cosmosdb"
  filter_tags_use_defaults = "${var.filter_tags_use_defaults}"
  filter_tags_custom       = "${var.filter_tags_custom},collectionname:%s"

  extra_tags = ["collectionname:%s"]
}
