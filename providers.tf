provider "aws" {
    region = var.region
    profile = "reinhed" 
}

terraform {
    backend "s3" {
        bucket  = "bindrill-1238"
        key     = "terraform.tfstate"
        region  = "us-west-1"
        profile = "reinhed" 
    }
}