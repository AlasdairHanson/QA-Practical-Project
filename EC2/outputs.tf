output "public_ipv4" {
    value = aws_instance.jenkins_ec2.public_ip
}