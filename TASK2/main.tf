provider "aws" {
        alias = "mumbai"
        region = "ap-south-1"
}

provider "aws" {
         alias = "north_vergenia"
         region = "us-east-1"
}

resource "aws_instance" "demo" {
        provider = aws.mumbai

        ami = "ami-0ad21ae1d0696ad58"
        instance_type = "t2.micro"
	user_data = <<-EOF
		#!bin/bash
		echo "installing Nginx Server"
		sudo apt-get update
		sudo apt-get install nginx -y
		EOF

        tags = {
                Name = "myterraform-instance"
                }
}

resource "aws_instance" "demo1" {
        provider = aws.north_vergenia

        ami = "ami-04a81a99f5ec58529"
	instance_type = "t2.micro"
        user_data = <<-EOF
                #!bin/bash
                echo "installing Nginx Server"
                sudo apt-get update
                sudo apt-get install nginx -y
                EOF

        tags = {
                Name = "myterraform1-instance"
                }
}
