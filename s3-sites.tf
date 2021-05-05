variable "zone_id" {}

module "s3_site-hwaet" {
  source = "./modules/s3-sites"
  site_name = "hwaet"
  repository = "autophagy/hwaet"
  zone_id    = var.zone_id
}

module "s3_site-haefen" {
  source = "./modules/s3-sites"
  site_name = "autophagy.io"
  subdomain = false
  repository = "autophagy/haefen"
  zone_id = var.zone_id
}
