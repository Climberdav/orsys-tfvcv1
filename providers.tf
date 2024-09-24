terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "0.50.0"
    }
    openstack = {
      source = "terraform-provider-openstack/openstack"
      # version = "2.1.0"
    }
  }
  # S3 backend configuration OVH
  backend "s3" {
    bucket = "tfstate-terraform-david"
    key    = "terraform.tfstate"
    region = "gra"
    endpoints = {
      s3 = "https://s3.gra.io.cloud.ovh.net/"
    }
    skip_credentials_validation = true
    skip_region_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = true
  }
}

provider "ovh" {
  # Configuration options
  endpoint           = "ovh-eu"
  application_key    = var.application_key
  application_secret = var.application_secret
  consumer_key       = var.consumer_key
}
provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3/"
}