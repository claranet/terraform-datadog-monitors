output "query_alert" {
  description = "The full filtering pattern including parentheses for service check monitor type"
  value       = "{${join(",", compact(concat(list(local.including_string), formatlist("!%s", local.excluding_list))))}}"
}

output "service_check" {
  description = "The full filtering pattern including braces for query alert monitor type"
  value       = ".over(\"${replace(local.including_string, ",", "\",\"")}\")${local.excluding_string == "" ? "" : ".exclude(\"${replace(local.excluding_string, ",", "\",\"")}\")"}"
}

output "event_alert" {
  description = "The full filtering pattern for event alert monitor type"
  value       = "tags:${local.including_string}${local.excluding_string == "" ? "" : " excluded_tags:${local.excluding_string}"}"
}
