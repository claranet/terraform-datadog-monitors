# CAAS KUBERNETES INGRESS VTS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-ingress-vts" {
  source      = "claranet/monitors/datadog//caas/kubernetes/ingress/vts"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Nginx Ingress 4xx errors
- Nginx Ingress 5xx errors

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../../common/filter-tags | n/a |
| <a name="module_filter-tags-4xx"></a> [filter-tags-4xx](#module\_filter-tags-4xx) | ../../../../common/filter-tags | n/a |
| <a name="module_filter-tags-5xx"></a> [filter-tags-5xx](#module\_filter-tags-5xx) | ../../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.nginx_ingress_too_many_4xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.nginx_ingress_too_many_5xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artificial_requests_count"></a> [artificial\_requests\_count](#input\_artificial\_requests\_count) | Number of false requests used to mitigate false positive in case of low trafic | `number` | `5` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_ingress_4xx_enabled"></a> [ingress\_4xx\_enabled](#input\_ingress\_4xx\_enabled) | Flag to enable Ingress 4xx errors monitor | `string` | `"true"` | no |
| <a name="input_ingress_4xx_extra_tags"></a> [ingress\_4xx\_extra\_tags](#input\_ingress\_4xx\_extra\_tags) | Extra tags for Ingress 4xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_ingress_4xx_message"></a> [ingress\_4xx\_message](#input\_ingress\_4xx\_message) | Message sent when an alert is triggered | `string` | `""` | no |
| <a name="input_ingress_4xx_threshold_critical"></a> [ingress\_4xx\_threshold\_critical](#input\_ingress\_4xx\_threshold\_critical) | 4xx critical threshold in percentage | `string` | `"40"` | no |
| <a name="input_ingress_4xx_threshold_warning"></a> [ingress\_4xx\_threshold\_warning](#input\_ingress\_4xx\_threshold\_warning) | 4xx warning threshold in percentage | `string` | `"20"` | no |
| <a name="input_ingress_4xx_time_aggregator"></a> [ingress\_4xx\_time\_aggregator](#input\_ingress\_4xx\_time\_aggregator) | Monitor aggregator for Ingress 4xx errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_ingress_4xx_timeframe"></a> [ingress\_4xx\_timeframe](#input\_ingress\_4xx\_timeframe) | Monitor timeframe for Ingress 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_ingress_5xx_enabled"></a> [ingress\_5xx\_enabled](#input\_ingress\_5xx\_enabled) | Flag to enable Ingress 5xx errors monitor | `string` | `"true"` | no |
| <a name="input_ingress_5xx_extra_tags"></a> [ingress\_5xx\_extra\_tags](#input\_ingress\_5xx\_extra\_tags) | Extra tags for Ingress 5xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_ingress_5xx_message"></a> [ingress\_5xx\_message](#input\_ingress\_5xx\_message) | Message sent when an alert is triggered | `string` | `""` | no |
| <a name="input_ingress_5xx_threshold_critical"></a> [ingress\_5xx\_threshold\_critical](#input\_ingress\_5xx\_threshold\_critical) | 5xx critical threshold in percentage | `string` | `"20"` | no |
| <a name="input_ingress_5xx_threshold_warning"></a> [ingress\_5xx\_threshold\_warning](#input\_ingress\_5xx\_threshold\_warning) | 5xx warning threshold in percentage | `string` | `"10"` | no |
| <a name="input_ingress_5xx_time_aggregator"></a> [ingress\_5xx\_time\_aggregator](#input\_ingress\_5xx\_time\_aggregator) | Monitor aggregator for Ingress 5xx errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_ingress_5xx_timeframe"></a> [ingress\_5xx\_timeframe](#input\_ingress\_5xx\_timeframe) | Monitor timeframe for Ingress 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginx_ingress_too_many_4xx_id"></a> [nginx\_ingress\_too\_many\_4xx\_id](#output\_nginx\_ingress\_too\_many\_4xx\_id) | id for monitor nginx\_ingress\_too\_many\_4xx |
| <a name="output_nginx_ingress_too_many_5xx_id"></a> [nginx\_ingress\_too\_many\_5xx\_id](#output\_nginx\_ingress\_too\_many\_5xx\_id) | id for monitor nginx\_ingress\_too\_many\_5xx |
## Related documentation

DataDog blog: https://www.datadoghq.com/blog/monitor-prometheus-metrics
https://github.com/kubernetes/ingress-nginx/pull/423/commits/1d38e3a38425f08de2f75fcae13896a3fec4d144

## Nginx Ingress Controller setup

This configuration and monitors only work for ingress controller version :
- \>= 0.10 because ingress is beta before that and metrics naming convention not stable
- <= 0.15 because ingress does not use VTS metrics since 0.16
Enable the following flags in the Nginx Ingress Controller chart
controller.stats.enabled=true,controller.metrics.enabled=true
and the following Datadog agent configuration for each ingress controller:
```
datadog:
  confd:
    prometheus.yaml: |-
      #nginx_upstream_responses_total{ingress_class,namespace,server,status_code:{1xx,2xx,3xx,4xx,5xx},upstream}
      #nginx_upstream_requests_total{ingress_class,namespace,server,upstream}
      init_config:
      instances:
        # The prometheus endpoint to query from
        - prometheus_url: http://nginx-ingress-controller-metrics:9913/metrics
          # This is NOT the ingress namespace, it is the prefix that will be used for the custom metrics
          namespace: nginx-ingress
          # Filter on the following metrics only
          metrics:
            - "nginx_upstream_requests_total"
            - "nginx_upstream_responses_total"
          # Adapt the tags to the current convention and verify that the monitor will match
          tags:
              - dd_monitoring:enabled
              - dd_ingress:enabled
              - dd_ingress_class:nginx
              - env:ENV
```
