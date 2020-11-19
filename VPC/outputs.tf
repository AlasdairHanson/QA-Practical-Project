output "vpcid" {
    value = aws_vpc.vpc.id
}

output "public_subnetid" {
    value = aws_subnet.public_sn.id
}

output "private_subnetid" {
    value = aws_subnet.private_sn.id
}
