output "vpc_id" {
	value = aws_vpc.main.id
}

output "url" {
	value = aws_lb.ALB-tf.dns_name
}
