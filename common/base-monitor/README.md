Base Datadog monitor
=====================

Purpose
-------
This monitor should be used a base template for all monitors since it gathers the best practices.

Best practices implemented :
- standard naming (environment, threshold and value)
- standard tagging with maps
- locked by default
- default values for most of the standard inputs

How to use this module
----------------------

```
module "storage_availability" {
  source = "../../../common/base-monitor"

  name          = "Azure Storage unvailability detected"
  environment   = "preprod"
  message       = "${var.message}"
  resource_kind = "storage"
  provider      = "azure"

  query = <<EOF
    avg(last_5m): (
      avg:azure.storage.availability{${data.template_file.filter.rendered}} by {resource_group,storage_type,name}
    ) < 90
EOF

  thresholds {
    critical = 90
    warning  = 50
  }

  notify_no_data   = true
  evaluation_delay = "${var.evaluation_delay}"

  extra_tags {
    "foo" = "bar"
  }
}
```

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environmen.t | string | - | yes |
| evaluation_delay | Time (in seconds) to delay evaluation, as a non-negative integer. | string | `600` | no |
| extra_tags | Extra tags to add on this monitor in addition of the standard ones. | map | `<map>` | no |
| message | A message to include with notifications for this monitor. Email notifications can be sent to specific users by using the same '@username' notation as events. | string | - | yes |
| name | Name of Datadog monitor. | string | - | yes |
| new_host_delay | Time (in seconds) to allow a host to boot and applications to fully start before starting the evaluation of monitor results. | string | `300` | no |
| no_data_timeframe | The number of minutes before a monitor will notify when data stops reporting. | string | `10` | no |
| notify_no_data | A boolean indicating whether this monitor will notify when data stops reporting. | string | - | yes |
| provider | Provider of the monitores resources (eg. azure, amazon). | string | - | yes |
| query | Query to use for monitor evaluation. | string | - | yes |
| require_full_window | A boolean indicating whether this monitor needs a full window of data before it's evaluated. | string | `false` | no |
| resource_kind | Kind of resource monitored (eg. storage, elasticsearch, apache, ec2). | string | - | yes |
| silenced | Map of the scopes to mute for a given timestamp (or 0). | map | `<map>` | no |
| thresholds | Map of the monitors thresholds, possible keys are `critical` and `warning`. | map | `<map>` | no |
| thresholds_unit | Unit of the values used as thresholds, used in monitor name. | string | `` | no |
| timeout_h | The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. | string | `0` | no |
| type | Type of monitor query (metric alert or query alert). | string | `metric alert` | no |

Related documentation
---------------------

Terraform DataDog documentation: [https://www.terraform.io/docs/providers/datadog/r/monitor.html](https://www.terraform.io/docs/providers/datadog/r/monitor.html)
