module "filter-tags" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "velero"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
}

module "filter-tags-scheduled-backup" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "velero"
  filter_tags_use_defaults    = var.filter_tags_scheduled_backup_use_defaults != null ? var.filter_tags_scheduled_backup_use_defaults : var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_scheduled_backup_custom != null ? var.filter_tags_scheduled_backup_custom : var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_scheduled_backup_custom_excluded != null ? var.filter_tags_scheduled_backup_custom_excluded : var.filter_tags_custom_excluded
}
