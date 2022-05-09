variable "bucket_name" {
    type = string
    description = "Name of the backend S3 bucket"
    default = "terraform-up-and-running-040122"
}

variable "table_name" {
    type = string
    description = "name of the dynamodb table"
    default = "terraform-up-and-running-locks"
}