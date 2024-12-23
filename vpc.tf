resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags       = merge({ Name = "Main VPC" })
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags                    = merge({ Name = "Public Subnet" })
}
