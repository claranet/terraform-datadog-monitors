
# v3.1.0 (September 06, 2019)

## Bug

*   [[MON-481](https://claranet-morea.atlassian.net/browse/MON-481)] - Fix alb latency metric unit and homogenize latency thresholds

## Documentation

*   [[MON-495](https://claranet-morea.atlassian.net/browse/MON-495)] - Add requirements to kubernetes monitors readme

## Improvement

*   [[MON-400](https://claranet-morea.atlassian.net/browse/MON-400)] - GCP Pub Sub improvements
*   [[MON-456](https://claranet-morea.atlassian.net/browse/MON-456)] - remove as_count() on kubernetes_state.container.status_report.count.waiting
*   [[MON-480](https://claranet-morea.atlassian.net/browse/MON-480)] - Increase alert treshold for Stream Analytics streaming units utilization
*   [[MON-482](https://claranet-morea.atlassian.net/browse/MON-482)] - Ignore silenced since we now must use downtime instead
*   [[MON-484](https://claranet-morea.atlassian.net/browse/MON-484)] - Ajust monitor Hub Too many d2c telemetry ingress not sent
*   [[MON-486](https://claranet-morea.atlassian.net/browse/MON-486)] - Remove workaround for here doc fmt now it is fixed in terraform 0.12.6
*   [[MON-494](https://claranet-morea.atlassian.net/browse/MON-494)] - Refactor auto update scripts
*   [[MON-502](https://claranet-morea.atlassian.net/browse/MON-502)] - Increase basic system triggers timeframes
*   [[MON-504](https://claranet-morea.atlassian.net/browse/MON-504)] - Update terraform and provider versions

## New Feature

*   [[MON-39](https://claranet-morea.atlassian.net/browse/MON-39)] - Monitors for Newrelic
*   [[MON-413](https://claranet-morea.atlassian.net/browse/MON-413)] - Terraform feature for pagerduty integration
*   [[MON-455](https://claranet-morea.atlassian.net/browse/MON-455)] - Monitor for kubernetes_state.container.status_report.count.terminated
*   [[MON-46](https://claranet-morea.atlassian.net/browse/MON-46)] - Monitors for AWS Lambdas
*   [[MON-472](https://claranet-morea.atlassian.net/browse/MON-472)] - Monitors for AWS SQS
*   [[MON-485](https://claranet-morea.atlassian.net/browse/MON-485)] - docker image for datadog terraform
*   [[MON-487](https://claranet-morea.atlassian.net/browse/MON-487)] - Datadog monitors VM integration RAM reserved
*   [[MON-489](https://claranet-morea.atlassian.net/browse/MON-489)] - Datadog monitors Azure VM Disk
*   [[MON-490](https://claranet-morea.atlassian.net/browse/MON-490)] - Changelog generation on git repos
*   [[MON-492](https://claranet-morea.atlassian.net/browse/MON-492)] - Indicate if a monitor is disabled by default on the README of each module
*   [[MON-493](https://claranet-morea.atlassian.net/browse/MON-493)] - Datadog monitors VM integration - requests failed
*   [[MON-497](https://claranet-morea.atlassian.net/browse/MON-497)] - Monitors for Docker
*   [[MON-498](https://claranet-morea.atlassian.net/browse/MON-498)] - Monitors for Kong
*   [[MON-499](https://claranet-morea.atlassian.net/browse/MON-499)] - Monitors HTTP, DNS and TLS

# v3.0.0 (July 05, 2019)

## Improvement

*   [[MON-476](https://claranet-morea.atlassian.net/browse/MON-476)] - check and update sets with more than 1 notify no data
*   [[MON-479](https://claranet-morea.atlassian.net/browse/MON-479)] - Upgrade datadog terraform provider to v2

## Bug

*   [[MON-460](https://claranet-morea.atlassian.net/browse/MON-460)] - Fix filter tags usage on keyvault and cosmos monitors
*   [[MON-461](https://claranet-morea.atlassian.net/browse/MON-461)] - Repair CI since it uses last 0.12 version image
*   [[MON-477](https://claranet-morea.atlassian.net/browse/MON-477)] - Fix wrong variable in query for kubernetes node inodes monitor
*   [[MON-478](https://claranet-morea.atlassian.net/browse/MON-478)] - Fix diff between CI and local env for sort command

## Epic

*   [[MON-459](https://claranet-morea.atlassian.net/browse/MON-459)] - Upgrade to terraform 0.12 (HCL 2.0)

# v2.9.0 (May 09, 2019)

## Improvement

*   [[MON-441](https://claranet-morea.atlassian.net/browse/MON-441)] - support extra tags for custom filtering
*   [[MON-446](https://claranet-morea.atlassian.net/browse/MON-446)] - Monitor Azure SQL Elastic Pool

## New Feature

*   [[MON-182](https://claranet-morea.atlassian.net/browse/MON-182)] - Monitors structure and config examples / stack template
*   [[MON-236](https://claranet-morea.atlassian.net/browse/MON-236)] - Append optional custom field to name of monitor
*   [[MON-453](https://claranet-morea.atlassian.net/browse/MON-453)] - Monitors for kubernetes kubelet volume stats space and inodes

## Bug

*   [[MON-442](https://claranet-morea.atlassian.net/browse/MON-442)] - Do not notify nodata on node unschedulable monitor
*   [[MON-444](https://claranet-morea.atlassian.net/browse/MON-444)] - Kubernetes status_report count waiting should not trigger on containercreating
*   [[MON-451](https://claranet-morea.atlassian.net/browse/MON-451)] - Nodata alerts on Azure App Services downscale

## Epic

*   [[MON-449](https://claranet-morea.atlassian.net/browse/MON-449)] - Datadog global CI

# v2.8.0 (April 23, 2019)

## Improvement

*   [[MON-320](https://claranet-morea.atlassian.net/browse/MON-320)] - Prefer greater operator logic
*   [[MON-326](https://claranet-morea.atlassian.net/browse/MON-326)] - use multi line query and EOQ everywhere
*   [[MON-327](https://claranet-morea.atlassian.net/browse/MON-327)] - Fix warning name for load balancer
*   [[MON-328](https://claranet-morea.atlassian.net/browse/MON-328)] - Improve mysql Innodb pool monitors
*   [[MON-330](https://claranet-morea.atlassian.net/browse/MON-330)] - Fix grouping and counter on azure monitors
*   [[MON-331](https://claranet-morea.atlassian.net/browse/MON-331)] - Improve mysql throughput monitor
*   [[MON-429](https://claranet-morea.atlassian.net/browse/MON-429)] - Update reference from cloudnative to pt-mon
*   [[MON-437](https://claranet-morea.atlassian.net/browse/MON-437)] - Update CI to use new gitlab runner

## New Feature

*   [[MON-114](https://claranet-morea.atlassian.net/browse/MON-114)] - Monitors for Kubernetes
*   [[MON-390](https://claranet-morea.atlassian.net/browse/MON-390)] - Monitors for Azure Functions

## Bug

*   [[MON-360](https://claranet-morea.atlassian.net/browse/MON-360)] - Feature enable/disable monitors creation does not work
*   [[MON-415](https://claranet-morea.atlassian.net/browse/MON-415)] - Remove Azure DBforMySQL Active connection query
*   [[MON-430](https://claranet-morea.atlassian.net/browse/MON-430)] - Use "instance" dimension on Azure App Service monitors metrics

# v2.7.0 (April 05, 2019)

## Improvement

*   [[MON-385](https://claranet-morea.atlassian.net/browse/MON-385)] - Add Azure EventGrid Datadog monitors
*   [[MON-417](https://claranet-morea.atlassian.net/browse/MON-417)] - Monitors for Azure Virtual Machine
*   [[MON-418](https://claranet-morea.atlassian.net/browse/MON-418)] - Monitors for Azure Load Balancer

## New Feature

*   [[MON-391](https://claranet-morea.atlassian.net/browse/MON-391)] - Monitors for Azure Search
*   [[MON-424](https://claranet-morea.atlassian.net/browse/MON-424)] - Monitors for GCE instance

## Bug

*   [[MON-405](https://claranet-morea.atlassian.net/browse/MON-405)] - Fix Azure CosmosDb monitors due to metrics changes
*   [[MON-425](https://claranet-morea.atlassian.net/browse/MON-425)] - Fix App Services response time monitor

# v2.6.0 (March 08, 2019)

## Bug

*   [[MON-402](https://claranet-morea.atlassian.net/browse/MON-402)] - Fix Azure DBforMySQL Active connection monitor
*   [[MON-403](https://claranet-morea.atlassian.net/browse/MON-403)] - Fix apache perpetual diff on apache connect monitor

## Improvement

*   [[MON-392](https://claranet-morea.atlassian.net/browse/MON-392)] - Update terraform-docs version in CI for DD monitors
*   [[MON-397](https://claranet-morea.atlassian.net/browse/MON-397)] - Exclude secretlist activity from Azure Key Vault latency monitor
*   [[MON-404](https://claranet-morea.atlassian.net/browse/MON-404)] - Make mysql Innodb buffer pool more tolerant

# v2.5.1 (January 24, 2019)

## Bug

*   [[MON-387](https://claranet-morea.atlassian.net/browse/MON-387)] - Azure IotHub monitors triggers nodata alerts since 2.5.0

# v2.5.0 (January 23, 2019)

## Bug

*   [[MON-335](https://claranet-morea.atlassian.net/browse/MON-335)] - Fix successful monitors false alarms
*   [[MON-383](https://claranet-morea.atlassian.net/browse/MON-383)] - Remove Azure Monitors using compute_consumption_percent
*   [[MON-386](https://claranet-morea.atlassian.net/browse/MON-386)] - Caas Nginx Ingress monitor fix and update for VTS

## Improvement

*   [[MON-237](https://claranet-morea.atlassian.net/browse/MON-237)] - Add new Azure Monitors
*   [[MON-295](https://claranet-morea.atlassian.net/browse/MON-295)] - Remove Azure global feature
*   [[MON-317](https://claranet-morea.atlassian.net/browse/MON-317)] - Prefix all cloudprovider filter tag with
*   [[MON-332](https://claranet-morea.atlassian.net/browse/MON-332)] - Add filter_tags on IOTHub monitors
*   [[MON-344](https://claranet-morea.atlassian.net/browse/MON-344)] - add default to hit ratio monitors
*   [[MON-377](https://claranet-morea.atlassian.net/browse/MON-377)] - Monitor Azure SQL Server status with DD

## New Feature

*   [[MON-336](https://claranet-morea.atlassian.net/browse/MON-336)] - Convert bitbucket pipeline to gitlab ci

# v2.4.0 (October 03, 2018)

## Bug

*   [[MON-301](https://claranet-morea.atlassian.net/browse/MON-301)] - Manage exclude on the module for filters
*   [[MON-323](https://claranet-morea.atlassian.net/browse/MON-323)] - fix pipeline using terraform-docs version 0.4.0

## Improvement

*   [[MON-309](https://claranet-morea.atlassian.net/browse/MON-309)] - Improve monitors using as_count() and division

## New Feature

*   [[MON-246](https://claranet-morea.atlassian.net/browse/MON-246)] - Monitors for Azure MySQL
*   [[MON-310](https://claranet-morea.atlassian.net/browse/MON-310)] - Monitors for Azure Postgresql
*   [[MON-316](https://claranet-morea.atlassian.net/browse/MON-316)] - Monitors for Azure server farms

# v2.3.1 (September 27, 2018)

## Bug

*   [[MON-313](https://claranet-morea.atlassian.net/browse/MON-313)] - elasticache memcached hit ratio miss multiplication by 100

## Improvement

*   [[MON-306](https://claranet-morea.atlassian.net/browse/MON-306)] - Use system.load.norm.5 instead of system.load.5
*   [[MON-307](https://claranet-morea.atlassian.net/browse/MON-307)] - GCP CloudSQL failover monitor increase timeframe
*   [[MON-308](https://claranet-morea.atlassian.net/browse/MON-308)] - Improve load balancer healthly host monitor
*   [[MON-311](https://claranet-morea.atlassian.net/browse/MON-311)] - Generate modules.tf with dynamic path
*   [[MON-312](https://claranet-morea.atlassian.net/browse/MON-312)] - Update readme with terraform-docs 0.4.0
*   [[MON-315](https://claranet-morea.atlassian.net/browse/MON-315)] - Doc monitor / system / generic: free memory message

# v2.3.0 (September 20, 2018)

## Bug

*   [[MON-273](https://claranet-morea.atlassian.net/browse/MON-273)] - service check query syntax does not work anymore
*   [[MON-304](https://claranet-morea.atlassian.net/browse/MON-304)] - Add default function to all latency based aws monitors

## Improvement

*   [[MON-159](https://claranet-morea.atlassian.net/browse/MON-159)] - Split delay variable in two separate variables (evaluation and new host)
*   [[MON-162](https://claranet-morea.atlassian.net/browse/MON-162)] - Add possibilty to disable / enable monitors
*   [[MON-199](https://claranet-morea.atlassian.net/browse/MON-199)] - Advanced monitors for Mongodb
*   [[MON-275](https://claranet-morea.atlassian.net/browse/MON-275)] - manage diff on monitor type from terraform
*   [[MON-287](https://claranet-morea.atlassian.net/browse/MON-287)] - Update service check monitors and doc
*   [[MON-288](https://claranet-morea.atlassian.net/browse/MON-288)] - Update all monitors with new tagging convention
*   [[MON-293](https://claranet-morea.atlassian.net/browse/MON-293)] - Optimize ci pipeline
*   [[MON-294](https://claranet-morea.atlassian.net/browse/MON-294)] - handle specific example for readme auto generation
*   [[MON-300](https://claranet-morea.atlassian.net/browse/MON-300)] - Improve and sandardize thresholds on GCP LB

## New Feature

*   [[MON-32](https://claranet-morea.atlassian.net/browse/MON-32)] - Monitors for AWS Elasticache
*   [[MON-92](https://claranet-morea.atlassian.net/browse/MON-92)] - Monitors for Mongodb
*   [[MON-105](https://claranet-morea.atlassian.net/browse/MON-105)] - Monitors for PostgreSQL
*   [[MON-122](https://claranet-morea.atlassian.net/browse/MON-122)] - Replication lag monitor for RDS
*   [[MON-142](https://claranet-morea.atlassian.net/browse/MON-142)] - Monitors for MySQL
*   [[MON-224](https://claranet-morea.atlassian.net/browse/MON-224)] - Monitors for GCP Cloud SQL
*   [[MON-226](https://claranet-morea.atlassian.net/browse/MON-226)] - Monitors for GCP PubSub
*   [[MON-227](https://claranet-morea.atlassian.net/browse/MON-227)] - Monitors for GCP LB
*   [[MON-228](https://claranet-morea.atlassian.net/browse/MON-228)] - Monitors for ElasticSearch
*   [[MON-230](https://claranet-morea.atlassian.net/browse/MON-230)] - Monitors for GCP BigQuery
*   [[MON-247](https://claranet-morea.atlassian.net/browse/MON-247)] - Monitors for Ark backups
*   [[MON-248](https://claranet-morea.atlassian.net/browse/MON-248)] - Monitors for Nginx Ingress Controller
*   [[MON-271](https://claranet-morea.atlassian.net/browse/MON-271)] - Monitors for Redis
*   [[MON-281](https://claranet-morea.atlassian.net/browse/MON-281)] - Monitor for disk forecast (system-generic)
*   [[MON-284](https://claranet-morea.atlassian.net/browse/MON-284)] - Add extra tags management to monitors
*   [[MON-286](https://claranet-morea.atlassian.net/browse/MON-286)] - Host Unreachable monitor on system generic
*   [[MON-289](https://claranet-morea.atlassian.net/browse/MON-289)] - Monitors for Nginx
*   [[MON-290](https://claranet-morea.atlassian.net/browse/MON-290)] - Monitors for Php-fpm

# v2.2.1 (August 08, 2018)

## Bug

*   [[MON-272](https://claranet-morea.atlassian.net/browse/MON-272)] - php fpm has changed from port to ping_url for group by
*   [[MON-276](https://claranet-morea.atlassian.net/browse/MON-276)] - Fix ALB / ELB space aggregator

# v2.2.0 (July 23, 2018)

## Improvement

*   [[MON-259](https://claranet-morea.atlassian.net/browse/MON-259)] - Improve readme generator

## New Feature

*   [[MON-233](https://claranet-morea.atlassian.net/browse/MON-233)] - Update main readme automatically
*   [[MON-234](https://claranet-morea.atlassian.net/browse/MON-234)] - Automatically generate output for each monitor

# v2.1.1 (July 10, 2018)

## Bug

*   [[MON-239](https://claranet-morea.atlassian.net/browse/MON-239)] - Fix alb no healthy instances thresholds

# v2.1.0 (June 29, 2018)

## Bug

*   [[MON-168](https://claranet-morea.atlassian.net/browse/MON-168)] - Apache can connect fails on query error

## Improvement

*   [[MON-160](https://claranet-morea.atlassian.net/browse/MON-160)] - Generalize the timeframe best practice
*   [[MON-170](https://claranet-morea.atlassian.net/browse/MON-170)] - Increase timeframe of ALB no healthy instances monitor
*   [[MON-179](https://claranet-morea.atlassian.net/browse/MON-179)] - No data events on Free disk inodes, Free disk space monitors
*   [[MON-184](https://claranet-morea.atlassian.net/browse/MON-184)] - no_data_timeframe should never be defined
*   [[MON-185](https://claranet-morea.atlassian.net/browse/MON-185)] - Monitors for Azure ServiceBus
*   [[MON-197](https://claranet-morea.atlassian.net/browse/MON-197)] - Ignore cache and buffer on memory monitor

## New Feature

*   [[MON-191](https://claranet-morea.atlassian.net/browse/MON-191)] - variabilize aggregator and timeframe when needed
*   [[MON-231](https://claranet-morea.atlassian.net/browse/MON-231)] - Update readme for every monitors sets easily

## Documentation

*   [[MON-181](https://claranet-morea.atlassian.net/browse/MON-181)] - update aws vpn readme to remove vpn_tunnel_address

# v2.0.1 (April 02, 2018)

## Bug

*   [[MON-166](https://claranet-morea.atlassian.net/browse/MON-166)] - Fix apigateway latency notify on no data

# v2.0.0 (March 25, 2018)

## Bug

*   [[MON-81](https://claranet-morea.atlassian.net/browse/MON-81)] - Fix basic monitors
*   [[MON-88](https://claranet-morea.atlassian.net/browse/MON-88)] - Treshold too high on aws_elb_latency
*   [[MON-108](https://claranet-morea.atlassian.net/browse/MON-108)] - typo monitor name apache middleware
*   [[MON-113](https://claranet-morea.atlassian.net/browse/MON-113)] - fix AWS ElasticSearch status monitor (aws.es.cluster_statusyellow)
*   [[MON-121](https://claranet-morea.atlassian.net/browse/MON-121)] - Fix ELB_backend_latency error
*   [[MON-127](https://claranet-morea.atlassian.net/browse/MON-127)] - Fix system tag in agent.yml
*   [[MON-128](https://claranet-morea.atlassian.net/browse/MON-128)] - [Datadog] Monitors for ELB issue with group by loadbalancer
*   [[MON-139](https://claranet-morea.atlassian.net/browse/MON-139)] - no data support for monitor name templating

## Improvement

*   [[MON-66](https://claranet-morea.atlassian.net/browse/MON-66)] - Refactor monitors repo with directories
*   [[MON-96](https://claranet-morea.atlassian.net/browse/MON-96)] - Update old monitors with new best practices
*   [[MON-99](https://claranet-morea.atlassian.net/browse/MON-99)] - Azure App Service monitor : count 2xx & 3xx http status codes as successful
*   [[MON-102](https://claranet-morea.atlassian.net/browse/MON-102)] - Auto-recovery for no-data tolerant monitors
*   [[MON-124](https://claranet-morea.atlassian.net/browse/MON-124)] - Add message input per monitor
*   [[MON-134](https://claranet-morea.atlassian.net/browse/MON-134)] - RAM alerts are now in non-business hours alerting by default.
*   [[MON-135](https://claranet-morea.atlassian.net/browse/MON-135)] - Use default on Event Hub query and update the used metrics
*   [[MON-136](https://claranet-morea.atlassian.net/browse/MON-136)] - Use rates for Azure IoT Hub monitors
*   [[MON-137](https://claranet-morea.atlassian.net/browse/MON-137)] - Use min as aggregate for Azure app services response time monitor
*   [[MON-140](https://claranet-morea.atlassian.net/browse/MON-140)] - Add a default function for api gateway, elb and alb monitors

## New Feature

*   [[MON-48](https://claranet-morea.atlassian.net/browse/MON-48)] - Monitors for API Gateway
*   [[MON-49](https://claranet-morea.atlassian.net/browse/MON-49)] - improve basic monitors
*   [[MON-82](https://claranet-morea.atlassian.net/browse/MON-82)] - Monitor message should be composed from variables
*   [[MON-91](https://claranet-morea.atlassian.net/browse/MON-91)] - Monitors for AWS VPN
*   [[MON-107](https://claranet-morea.atlassian.net/browse/MON-107)] - Monitors for AWS Elasticsearch Service
*   [[MON-110](https://claranet-morea.atlassian.net/browse/MON-110)] - Monitors for AWS Kinesis Firehose streams
*   [[MON-112](https://claranet-morea.atlassian.net/browse/MON-112)] - Monitors for AWS ALB

## Sub-task

*   [[MON-30](https://claranet-morea.atlassian.net/browse/MON-30)] - Monitors for AWS RDS
*   [[MON-34](https://claranet-morea.atlassian.net/browse/MON-34)] - Monitors for AWS ELB
*   [[MON-74](https://claranet-morea.atlassian.net/browse/MON-74)] - Azure App Services monitors
*   [[MON-75](https://claranet-morea.atlassian.net/browse/MON-75)] - Azure SQL monitors
*   [[MON-76](https://claranet-morea.atlassian.net/browse/MON-76)] - Azure Redis monitors
*   [[MON-77](https://claranet-morea.atlassian.net/browse/MON-77)] - Azure Event Hub monitors
*   [[MON-78](https://claranet-morea.atlassian.net/browse/MON-78)] - Azure Stream Analytics monitors
*   [[MON-79](https://claranet-morea.atlassian.net/browse/MON-79)] - Azure Storage monitors
*   [[MON-80](https://claranet-morea.atlassian.net/browse/MON-80)] - Azure IOT Hub monitors
*   [[MON-90](https://claranet-morea.atlassian.net/browse/MON-90)] - API Management monitors

## Story

*   [[MON-73](https://claranet-morea.atlassian.net/browse/MON-73)] - Azure managed services monitors

## Documentation

*   [[MON-97](https://claranet-morea.atlassian.net/browse/MON-97)] - Update readme on terraform monitors repo

# v1.0.0 (December 24, 2017)

## Improvement

*   [[MON-93](https://claranet-morea.atlassian.net/browse/MON-93)] - AWS ELB custom tags
*   [[MON-131](https://claranet-morea.atlassian.net/browse/MON-131)] - Replace comparator variable by a hardcode comparator in monitor name
*   [[MON-144](https://claranet-morea.atlassian.net/browse/MON-144)] - Default nodata message must be 24x7

## New Feature

*   [[MON-43](https://claranet-morea.atlassian.net/browse/MON-43)] - Agent installation

## Story

*   [[MON-27](https://claranet-morea.atlassian.net/browse/MON-27)] - Monitors for main middlewares
