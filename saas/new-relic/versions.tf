terraform {
  required_providers {
    datadog = {
      source = "terraform-providers/datadog"
    }
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
  required_version = ">= 0.13"
}
