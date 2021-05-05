terraform {
  backend "s3" {
    bucket = "autophagy-tf"
    key    = "terraform"
    region = "eu-central-1"
  }
}

