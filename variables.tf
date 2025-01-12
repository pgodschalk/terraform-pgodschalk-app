variable "dns_record" {
  default = null
  type = map(object({
    content = set(string)
    domain  = optional(string, "kernelpanics.nl")
    expire  = optional(number, 86400)
    name    = string
    type    = optional(string, "CNAME")
  }))
  description = "The DNS record to create"
}
