output "employee_table_name" {
    description = "value of the DynamoDB table name"
    value = aws_dynamodb_table.employees.name
}