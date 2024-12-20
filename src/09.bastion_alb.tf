resource "aws_lb" "bastion_alb" {
    name = "bastion-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [ aws_security_group.bastion_sg.id]
    subnets = [aws_subnet.eks_pub01.id, aws_subnet.eks_pub02.id]
     

    tags = {
        Name = "bastion-alb"
    }
}

output "load_name" {
    value = aws_lb.bastion_alb.dns_name
}