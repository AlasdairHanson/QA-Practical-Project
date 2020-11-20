output "jenkins_ipv4" {
    value = aws_instance.jenkins_ec2.public_ip
}

output "pytest_ipv4" {
    value = aws_instance.pytest_ec2.public_ip
}