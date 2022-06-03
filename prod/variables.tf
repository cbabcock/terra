variable "security_group_name" {
  default = "terrafrom-prod-instance"
  description = "Name of the security group"
}

variable "server_port" {
  default = 8080
  description = "Port to access Busybox"
}

