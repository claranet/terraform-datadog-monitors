# MONITOR TAGS Datadog Generator

## How to use this module

This module usage should be transparent because it should be used inside each monitors set directly.
Here is a simple example but it is advisable to see how are created other existing monitors sets:

```
module "monitor-tags" {
  source = "../../common/monitor-tags"

  environment  = "${var.environment}"
  extra_tags   = "${var.extra_tags}"
}
```

## Purpose

Creates a default and a extra list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. 
Note: it's not currently possible to filter by these tags when querying via the API

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra optional tags added to include filtering in any case (i.e. ["tag1:val1", "tag2:val2"]) | `list(string)` | `[]` | no |
| <a name="input_extra_tags_excluded"></a> [extra\_tags\_excluded](#input\_extra\_tags\_excluded) | Extra optional tags added to exclude filtering in any case (i.e. ["tag1:val1", "tag2:val2"]) | `list(string)` | `[]` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false (i.e. "tag1:val1,tag2:val2") | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false (i.e. "tag1:val1,tag2:val2") | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the query separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_resource"></a> [resource](#input\_resource) | The dedicated tag for the resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_alert"></a> [event\_alert](#output\_event\_alert) | The full filtering pattern for event alert monitor type |
| <a name="output_query_alert"></a> [query\_alert](#output\_query\_alert) | The full filtering pattern including parentheses for service check monitor type |
| <a name="output_service_check"></a> [service\_check](#output\_service\_check) | The full filtering pattern including braces for query alert monitor type |

## Related documentation

Datadog API type of monitor: [https://docs.datadoghq.com/api/?lang=python#create-a-monitor](https://docs.datadoghq.com/api/?lang=python#create-a-monitor)
Terraform guide: [https://www.terraform.io/docs/configuration-0-11/interpolation.html](https://www.terraform.io/docs/configuration-0-11/interpolation.html)

