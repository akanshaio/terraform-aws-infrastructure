resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-ec2"
  
  public_key = file("${path.module}/keys/terraform-ec2.pub")
}