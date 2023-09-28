# terraform {
#     backend "s3" {
#         bucket = "terraform-backend-krm-vlx"
#         key = "/krm-eks/eks/terraform.tfstate"
#         region = "us-east-1"
#         dynamodb_table = "terraform-up-and-running-locks"
#         encrypt = true
#     }
# }