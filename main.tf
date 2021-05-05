terraform {
  backend "s3" {
    bucket = "autophagy-tf"
    key    = "terraform"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "tf-backend" {
  bucket = "autophagy-tf"
}
