terraform {
  backend "s3" {
    bucket = "my-devops-project-tf-state"
    key = "terraform.tfstate"
    region = "us-east-1"
    profile = "default"
    encrypt = true
    use_lockfile = true
  }
}