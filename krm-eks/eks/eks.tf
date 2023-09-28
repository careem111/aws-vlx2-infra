
module "eks_cluster_infra" {
    source = "github.com/careem111/vlx2-tform-modules//modules/infra?ref=v0.0.1"

    
  
    vpc_cidr  = "10.1.0.0/16"
    vpc_name = "vlx2-eks"
    az1 = "us-east-1b"
    az2 = "us-east-1c"
    pub_subnet_1_cidr = "10.1.1.0/24"
    pub_subnet_2_cidr = "10.1.2.0/24"
    pub_subnet_1_name = "public-sub-1"
    pub_subnet_2_name = "public-sub-2"
    pub_rt_name = "vlx2-eks-public-routing-table"

}

resource "aws_eks_cluster" "eks" {
  name = "vlx2-eks-01"
  role_arn = aws_iam_role.master.arn
  version = "1.26"

  vpc_config {
    subnet_ids = [module.eks_cluster_infra.pub_subnet_1_id, module.eks_cluster_infra.pub_subnet_2_id]
    #pub_sub1.id is already exposed in the output.tf in modules, thats why we can call it here
    security_group_ids = [aws_security_group.node.id]
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    module.eks_cluster_infra.pub_subnet_1_id,
    module.eks_cluster_infra.pub_subnet_2_id,
  ]

}

# data "template_file" "user_data" {
#     template = file("user-data.sh")
# }

# resource "aws_instance" "jenkins" {
#   ami           = "ami-053b0d53c279acc90" # belongs to us-east-1 ami
#   instance_type = "t3.medium"
#   key_name = var.ssh-key
#   vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
#   user_data = data.template_file.user_data.rendered
#   subnet_id = module.eks_cluster_infra.pub_subnet_1_id

#   tags = {
#     Name = "jenkins-master"
#   }
# }