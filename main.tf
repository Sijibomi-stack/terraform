resource    "aws_instance" "webserver" {
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        name = "webserver"
        description = " An Nginx on ubuntu"
    }
    user_data = <<-EOF
                ##!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                sudo systemctl enable nginx
                sudo systemctl start nginx
                EOF
    key_name = aws_key_pair.nginx.id
    vpc_security_group_ids = [ aws_security_group.ssh-access1.id ]
    
    provisioner "local-exec" {
        command = "echo ${aws_instance.webserver.public_ip} Created! >> C:\\Users\\sijia\\OneDrive\\Documents\\terraform\\ips.txt"
    }
}
resource "aws_key_pair" "nginx" {
    public_key = ""
    
}
resource "aws_security_group" "ssh-access1" {
    name = "ssh-access1"
    description = "Allow ssh access to EC2 instance"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }  
}

