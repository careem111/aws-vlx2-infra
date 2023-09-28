# create s3 bucket
resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-backend-krm-vlx"
    # Prevent accidental deletion of this S3 bucket
    lifecycle {
    prevent_destroy = true
    }

}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
        status = "Enabled"
    }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
    bucket = aws_s3_bucket.terraform_state.bucket
    rule {
        apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
            }
    }
    }

# create dynamoDB table
resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID" # primary key

    attribute {
        name = "LockID" # name of the attribute
        type = "S" # string
    }
}