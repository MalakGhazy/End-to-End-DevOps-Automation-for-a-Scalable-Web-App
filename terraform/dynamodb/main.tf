resource "aws_dynamodb_table" "employees" {
    name = var.table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = var.hash_key

    attribute {
      name = var.hash_key
      type = "S"
    }

    tags = {
      Environment = var.environment
      Project     = var.project
    }
  
}