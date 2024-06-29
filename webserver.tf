resource "aws_instance" "hellow-world" {

ami = "ami-04b70fa74e45c3917"
instance_type = "t2.micro"
vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
key_name = "terraform"
tags= {
    Name = "hello world"
}
user_data = <<-EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
cd /var/www/html
sudo rm -rf *
sudo git clone https://github.com/Linsmed/alt_sch_assignment3.git
sudo systemctl restart apache2
EOF
}
