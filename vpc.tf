# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    CreatedBy  = "Naincy"
    Name = "My VPC"
 }
}