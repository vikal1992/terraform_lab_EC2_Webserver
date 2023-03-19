resource "aws_instance" "demo_ec2" {
  ami                    = "ami-0cca134ec43cf708f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  key_name               = "demo"
  tags = {
    "Name" = "prod_ec2_1"
  }

user_data = <<-EOF
#!/bin/bash -xe
cd /tmp
yum update -y
yum install -y httpd
echo "Hello from the EC2 instance $(hostname -f)." > /var/www/html/index.html
systemctl start httpd
EOF

}
