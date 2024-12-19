resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow traffic for the bastion server"
  vpc_id      = aws_vpc.eks_vpc.id

  tags = {
    Name = "bastion_sg"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["60.196.24.130/32"]
  security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "allow_egress_bastion" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  description = "Allow traffic for a eks cluster"
  vpc_id      = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_cluster_sg"
  }
}

resource "aws_security_group_rule" "allow_ingress_from_bastion" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion_sg.id
  security_group_id        = aws_security_group.eks_cluster_sg.id
}

# resource "aws_security_group_rule" "allow_egress_eks_cluster" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.bastion_sg.id
# }

resource "aws_security_group" "eks_node_grp_sg" {
  name        = "eks-node-grp-sg"
  description = "Allow traffic for a eks node group"
  vpc_id      = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_node_grp_sg"
  }
}

resource "aws_security_group_rule" "allow_ingress_from_cluster" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.eks_cluster_sg.id
  security_group_id        = aws_security_group.eks_node_grp_sg.id
}

# resource "aws_security_group_rule" "allow_egress_node_group" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.eks_node_grp_sg.id
# }