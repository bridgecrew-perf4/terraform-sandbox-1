locals {
  id = "projects/josh-1234"
  id_split = split("/", local.id)
  short_id_last = element(local.id_split, length(local.id_split)-1)
}

output "short_id" {
  value = local.id_split[1]
}

output "short_id_last" {
  value = local.short_id_last
}
