provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_instance" "ec2-instance" {
    ami = "ami-0c9fb5d338f1eec43"
    instance_type = "t2.micro"
    key_name = "my"
    vpc_security_group_ids = ["sg-00cccfbe405e307c7"]
  
}