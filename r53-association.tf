resource "aws_route53_vpc_association_authorization" "example" {
  
  zone_id = var.PRIVATE_HOSTED_ZONE_ID
  vpc_id  = aws_vpc.main.id
  
}