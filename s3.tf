resource "aws_s3_bucket" "example" {
  bucket = "terraform-state-bucket"
  tags = {
    Environment = var.environment
    Name        = "Terraform State Bucket"
  }
}