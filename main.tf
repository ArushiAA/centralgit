terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
  /* 
  
  backend "s3" {
       # Replace this with your bucket name!
      bucket = "remotestates3bucket23032024"
      key = "terraform.tfstate"
      region= "us-west-2"
      # Replace this with your DynamoDB table name!
      dynamodb_table = "terraform-remote-state-dynamo"
      encrypt        = true
     }
     
      */
}

provider "aws" {
  region  = "us-west-2"
 // profile = "ec2"
}

resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"
  count 2

  tags = {
    Name = "var.ec2_name"
  }
}

/* 

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
} 

*/