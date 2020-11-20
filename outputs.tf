output "jenkins_ip" {
  value = module.my_ec2.jenkins_ipv4
}

output "pytest_ip" {
  value = module.my_ec2.pytest_ipv4
}