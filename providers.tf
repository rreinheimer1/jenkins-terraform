provider "aws" {
    region = var.region
}

terraform {
    backend "s3" {
        bucket  = "bindrill-1237"
        key     = "terraform.tfstate"
        region  = var.region
    }
}