output service_accounts_emails {
  value = {
    monitoring_datadog = "${google_service_account.monitoring_datadog.email}"
  }
}
