terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.1.2"
    }
  }
  required_version = ">= 0.12.31"
}
