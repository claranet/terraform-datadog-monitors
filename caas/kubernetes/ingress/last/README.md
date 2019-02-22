# CAAS KUBERNETES INGRESS LAST DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-ingress-last" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//caas/kubernetes/ingress/last?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Nginx Ingress 4xx errors
- Nginx Ingress 5xx errors
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artificial\_requests\_count | Number of false requests used to mitigate false positive in case of low trafic | string | `"5"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| ingress\_4xx\_enabled | Flag to enable Ingress 4xx errors monitor | string | `"true"` | no |
| ingress\_4xx\_extra\_tags | Extra tags for Ingress 4xx errors monitor | list | `[]` | no |
| ingress\_4xx\_message | Message sent when an alert is triggered | string | `""` | no |
| ingress\_4xx\_silenced | Groups to mute for Ingress 4xx errors monitor | map | `{}` | no |
| ingress\_4xx\_threshold\_critical | 4xx critical threshold in percentage | string | `"40"` | no |
| ingress\_4xx\_threshold\_warning | 4xx warning threshold in percentage | string | `"20"` | no |
| ingress\_4xx\_time\_aggregator | Monitor aggregator for Ingress 4xx errors [available values: min, max or avg] | string | `"min"` | no |
| ingress\_4xx\_timeframe | Monitor timeframe for Ingress 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| ingress\_5xx\_enabled | Flag to enable Ingress 5xx errors monitor | string | `"true"` | no |
| ingress\_5xx\_extra\_tags | Extra tags for Ingress 5xx errors monitor | list | `[]` | no |
| ingress\_5xx\_message | Message sent when an alert is triggered | string | `""` | no |
| ingress\_5xx\_silenced | Groups to mute for Ingress 5xx errors monitor | map | `{}` | no |
| ingress\_5xx\_threshold\_critical | 5xx critical threshold in percentage | string | `"20"` | no |
| ingress\_5xx\_threshold\_warning | 5xx warning threshold in percentage | string | `"10"` | no |
| ingress\_5xx\_time\_aggregator | Monitor aggregator for Ingress 5xx errors [available values: min, max or avg] | string | `"min"` | no |
| ingress\_5xx\_timeframe | Monitor timeframe for Ingress 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |

## Outputs

| Name | Description |
|------|-------------|
| nginx\_ingress\_too\_many\_4xx\_id | id for monitor nginx_ingress_too_many_4xx |
| nginx\_ingress\_too\_many\_5xx\_id | id for monitor nginx_ingress_too_many_5xx |

Related documentation
---------------------

DataDog blog: https://www.datadoghq.com/blog/monitor-prometheus-metrics
https://github.com/kubernetes/ingress-nginx/issues/2924

Nginx Ingress Controller setup
------------------------------
This configuration and monitors only work for ingress controller version >= 0.16
Enable the following flags in the Nginx Ingress Controller chart
controller.stats.enabled=true,controller.metrics.enabled=true
and the following Datadog agent configuration for each ingress controller:
```
datadog:
  confd:
    prometheus.yaml: |-
      init_config:
      instances:
        # The prometheus endpoint to query from
        - prometheus_url: http://nginx-ingress-controller-metrics:9913/metrics
          # This is NOT the ingress namespace, it is the prefix that will be used for the custom metrics
          namespace: nginx-ingress
          # Filter on the following metrics only
          metrics:
            - "nginx_ingress.nginx_ingress_controller_requests"
          # Adapt the tags to the current convention and verify that the monitor will match
          tags:
              - dd_monitoring:enabled
              - dd_ingress:enabled
              - dd_ingress_class:nginx
              - env:ENV
```
