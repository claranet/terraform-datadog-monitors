
locals {
  alerting-message = templatefile(
    "${path.module}/templates/alerting-message.tftpl",
    {
      message_alert    = var.message_alert,
      message_warning  = var.message_warning == null ? var.message_alert : var.message_warning,
      message_nodata   = var.message_nodata == null ? var.message_alert : var.message_nodata,
      message_recovery = join(" ", compact(distinct([var.message_alert, var.message_warning, var.message_nodata]))),
      prepend_text     = var.prepend_text,
      append_text      = var.append_text
  })
}
