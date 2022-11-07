resource "aws_db_subnet_group" "main" {
  name        = var.db_subnet_group_name
  subnet_ids  = var.subnet_ids
  description = var.db_subnet_group_description
  tags = {
    Name = var.db_subnet_group_name
  }
}