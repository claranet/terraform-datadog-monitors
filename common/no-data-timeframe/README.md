# NO DATA TIMEFRAME Datadog Generator

## How to use this module

This module usage should be transparent because it should be used inside each monitors set directly.
Here is a simple example but it is advisable to see how are created other existing monitors sets:

```
module "no-data-timeframe" {
  source    = "../../common/no-data-timeframe"

  timeframe = "${var.my_monitor_timeframe}" # i.e. "last_15m"
}
```

## Purpose

Calculate right no data timeframe value from the global timeframe variable.
According to Datadog API documentation, `no_data_timeframe` should be set to:

* 2x the timeframe minimum for metric/query alerts
* 2 minutes minimum for service check alerts

The only one output of this module could be directly used to set `no_data_timeframe` parameter in monitor conception.

Notice: while service check monitors does not depends on `timeframe` value and calculation this module seems not necessary.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| timeframe | Monitor global timeframe [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| metric | no_data_timeframe calculated value in minutes for metric monitors |

## Related documentation

Datadog API create monitor: [https://docs.datadoghq.com/api/?lang=bash#create-a-monitor](https://docs.datadoghq.com/api/?lang=bash#create-a-monitor)

