data "terraform_remote_state" "example" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "apardo04"
    token        = var.remote_state_token
    workspaces = {
      name = "Example-Workspace"
    }
  }
}

variable "remote_state_token" {
  type = string
}

provider "aws" {
  profile = "terraform"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}