module "filter-tags" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "aws_beanstalk"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
}

# With AWS beanstalk some metrics are send per host and per beanstalk env.
# This is particularly the case for all the ApplicationLatency metrics and
# the ApplicationRequests (not for the health and the cpu/disk metrics).
# The best way to find this out is to go on the monitoring configuration page
# of your beanstalk environment.
#
# In order to differentiate those metrics we need to do some exclusion to
# to find out which values has been sent for the host and the one sent for
# the environment itself.
# Some automatic tags are added on the instances by AWS, this seems to be
# the only way to filter at the moment.
#
# This filter exclude the metrics sent for the hosts.
module "filter-tags-no-host" {
  source = "../../../common/filter-tags"

  environment                 = var.environment
  resource                    = "aws_beanstalk"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
  extra_tags_excluded         = ["aws_cloudformation_logical-id:awsebautoscalinggroup"]
}

