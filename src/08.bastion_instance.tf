data "aws_key_pair" "keypair" {
  key_name = "key"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.eks_pub02.id
  associate_public_ip_address = "true"
  key_name                    = "key"
  # user_data                   = file("userdata.sh")
  security_groups             = [aws_security_group.bastion_sg.id]

  root_block_device {
    volume_size = 15
  }

  tags = {
    Name = "bastion"
  }
}
