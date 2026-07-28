terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.46.0"
    }
  }
  required_version = ">= 0.12.31"
}
