terraform {
  required_providers {
    datadog = {
      source = "terraform-providers/datadog"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 0.12.26"
}
