resource "aws_security_group" "dev-public-sg" {
    name        = var.dev_public_sg_name
    description = "Public security group for the dev environment"
    vpc_id      = aws_vpc.Dev_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
        Name        = var.dev_public_sg_name
    }
}

resource "aws_security_group" "dev-private-sg" {
    name        = var.dev_private_sg_name
    description = "Private security group for the dev environment"
    vpc_id      = aws_vpc.Dev_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "10.0.0.0/16" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "10.0.2.0/24" ]
    }

    tags = {
        Name        = var.dev_private_sg_name
    }
}

