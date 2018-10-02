output "query_alert" {
  description = "The full filtering pattern including parentheses for service check monitor type"
  value       = "{${join(",", compact(concat(list(local.including), formatlist("!%s", compact(split(",", local.excluding))))))}}"
}

output "service_check" {
  description = "The full filtering pattern including braces for query alert monitor type"
  #value       = "over.(\"${replace(local.including, ",", "\",\"")}\").exclude(\"${replace(local.excluding, ",", "\",\"")}\")"
  value       = ".over(\"${replace(local.including, ",", "\",\"")}\")${local.excluding == "" ? "" : ".exclude(\"${replace(local.excluding, ",", "\",\"")}\")"}"
}
