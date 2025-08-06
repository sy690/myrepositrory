# terraform {
#   backend "s3" {
#     bucket = "terraform-bucket-1231234"
#     key = "state/tarraform.tfstate"
#     region = "us-east-1"
#   }
# }

# provider "aws"{
#     region = "us-east-1"
    
# }
# resource "aws_instance" "my-instance" {
# ami = "ami-020cba7c55df1f615"
# instance_type = "t2.micro"
# key_name = "my"
# vpc_security_group_ids = ["sg-075e03b30d0894f2a"]

# }


provider "aws" {
    region = "us-east-1"
  
}
terraform {
  backend "s3" {
    bucket = "my-terraform-backend-12345"
    key = "project1/env/dev/terraform.tfstate"
    region = "us-east-1"
    
  }
}
resource "aws_instance" "my-ins" {
    ami = "ami-020cba7c55df1f615"
instance_type = "t2.micro"
 key_name = "my"
vpc_security_group_ids = ["sg-075e03b30d0894f2a"]

  
}