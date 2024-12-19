resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }
}

resource "aws_route_table_association" "rt_pub01" {
  subnet_id      = aws_subnet.eks_pub01.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rt_pub02" {
  subnet_id      = aws_subnet.eks_pub02.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rt_pri01" {
  subnet_id      = aws_subnet.eks_pri01.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rt_pri02" {
  subnet_id      = aws_subnet.eks_pri02.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rt_pri03" {
  subnet_id      = aws_subnet.eks_pri03.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rt_pri04" {
  subnet_id      = aws_subnet.eks_pri04.id
  route_table_id = aws_route_table.private_rt.id
}

