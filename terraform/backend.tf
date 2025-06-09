terraform {
  backend "s3" {
    bucket = "nodejs-bucket-malak"
    key = "terraform.tfstate"
    region = "us-east-1"
    profile = "malak-terraform"
    encrypt = true
    use_lockfile = true
  }
}