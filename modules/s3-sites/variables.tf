variable "site_name" {
  description = "The name of the site/project"
  type        = string
}

variable "subdomain" {
  description = "Whether the site is a subdomain of the root domain"
  type        = bool
  default     = true
}

variable "root_domain" {
  description = "The root domain that subdomains should fall under"
  type        = string
  default     = "autophagy.io"
}

variable "repository" {
  description = "The source repository for the site."
  type        = string
}

variable "zone_id" {
  description = "Cloudflare zone ID"
  type        = string
}
