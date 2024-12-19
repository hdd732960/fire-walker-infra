resource "aws_subnet" "eks_pub01" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "eks-pub01"
  }
}

resource "aws_subnet" "eks_pub02" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "eks-pub02"
  }
}

resource "aws_subnet" "eks_pri01" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "eks-pri01"
  }
}

resource "aws_subnet" "eks_pri02" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "eks-pri02"
  }
}

resource "aws_subnet" "eks_pri03" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "eks-pri03"
  }
}

resource "aws_subnet" "eks_pri04" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.31.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "eks-pri04"
  }
}