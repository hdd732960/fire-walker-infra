resource "aws_eip" "eip_natgw" {
  domain = "vpc"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip_natgw.id
  subnet_id     = aws_subnet.eks_pub01.id

  depends_on = [aws_internet_gateway.igw]
}