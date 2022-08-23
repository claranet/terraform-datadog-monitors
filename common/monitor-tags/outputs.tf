# Inputs example values:
#TF_VAR_environment='prod' TF_VAR_default_tags="tag:val,tag2:val2" TF_VAR_extra_tags="tag3:val3,tag4:val4" terraform apply

# query_alert = ["tag:val", "tag2:val2"]
output "tags" {
  description = "The full list of tags for monitors"
  value       = concat(["env:${var.environment}", "created-by:terraform"], var.default_tags, var.extra_tags)
}


