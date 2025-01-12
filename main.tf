terraform {
  required_version = ">= 1.0"

  required_providers {
    transip = {
      source  = "aequitas/transip"
      version = "~> 0.1.0"
    }
  }
}

data "transip_domain" "this" {
  for_each = var.dns_record != null ? { for k, v in var.dns_record : k => v } : {}

  name = each.value.domain
}

resource "transip_dns_record" "this" {
  for_each = var.dns_record != null ? { for k, v in var.dns_record : k => v } : {}

  content = toset(each.value.content)
  domain  = data.transip_domain.this[each.key].id
  expire  = each.value.expire
  name    = each.value.name
  type    = each.value.type
}
