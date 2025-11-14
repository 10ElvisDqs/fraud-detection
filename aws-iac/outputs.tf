output "public_ip" {
  description = "Ip pública generada"
  value = aws_instance.app_server.public_ip
}

#output "secret_key" {
#  description = "secret key"
#  value = tls_private_key.ssh_key.private_key_pem
#  sensitive = true
#}
