terraform {
    backend "s3" {
    bucket         = "terraform-up-and-running-040122"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    }
}

provider "aws" {
    region = "us-east-2"
}

resource "aws_db_instance" "example" {
    identifier_prefix = "terraform-up-and-running"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    db_name = "example_database"
    username = "admin"

    #how should we set the password?
    password = local.db_creds.password
}
data "aws_secretsmanager_secret_version" "db_password" {
    secret_id = "db_creds"
}

locals {
    db_creds = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)
}