resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "my-node-app-repo"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
    Project     = "my-node-app"
  }
}