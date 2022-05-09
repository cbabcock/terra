variable "security_group_name" {
  default = "terrafrom-example-instance"
  description = "Name of the security group"
}

variable "server_port" {
  default = 8080
  description = "Port to access Busybox"
}

