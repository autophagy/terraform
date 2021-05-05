locals {
  name = var.subdomain ? var.site_name : var.root_domain
}

resource "cloudflare_record" "site_record" {
  zone_id = var.zone_id
  name = local.name
  value = aws_s3_bucket.site_bucket.website_endpoint
  type = "CNAME"
  proxied = true
}

