locals {
  fqdn = "${var.subdomain ? "${var.site_name}.${var.root_domain}" : var.root_domain}"
}

resource "aws_s3_bucket" "site_bucket" {
  bucket = local.fqdn

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "Static :: ${local.fqdn}"
    Repo = var.repository
  }
}

resource "aws_s3_bucket_public_access_block" "block_acls" {
  bucket = aws_s3_bucket.site_bucket.id

  block_public_acls = true
  ignore_public_acls = true
  block_public_policy = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "cloudflare_rules" {
  bucket = aws_s3_bucket.site_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "PublicReadGetObject"
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.site_bucket.arn}/*"
        Condition = {
          IpAddress = {
            "aws:SourceIp" = [
              "2400:cb00::/32",
              "2405:8100::/32",
              "2405:b500::/32",
              "2606:4700::/32",
              "2803:f800::/32",
              "2c0f:f248::/32",
              "2a06:98c0::/29",
              "103.21.244.0/22",
              "103.22.200.0/22",
              "103.31.4.0/22",
              "104.16.0.0/13",
              "104.24.0.0/14",
              "108.162.192.0/18",
              "131.0.72.0/22",
              "141.101.64.0/18",
              "162.158.0.0/15",
              "172.64.0.0/13",
              "173.245.48.0/20",
              "188.114.96.0/20",
              "190.93.240.0/20",
              "197.234.240.0/22",
              "198.41.128.0/17",
            ]
          }
        }
      },
    ]
  })
}

