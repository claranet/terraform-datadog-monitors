locals {
  common_tags = ["env:${var.environment}", "team:${var.team}", "created-by:terraform"]
}
