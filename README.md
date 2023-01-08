# rancher-terraform-eks-cluster
EKS Cluster provisioned by Terraform, hosted on AWS Public Cloud and using Helm Charts for Rancher deployment on Worker Node.

# Architecture
Enter Image

**Note:** - The following architecture doesn't reflect all the components that are created by this template. However, it does provide a high-level overview of the core infrastructure that will be created.

# Prerequisites
* An AWS Account with an IAM user capable of creating resources – `AdminstratorAccess`
* A locally configured AWS profile for the above IAM user
* Terraform installation - [steps](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* AWS EC2 key pair - [steps](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
* Environment Variables for AWS CLI - [steps](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

# How to Apply/Destroy
This section details the deployment and teardown of the three-tier-architecture. **Warning: this will create AWS resources that costs money**

## Deployment steps

### Applying the Terraform Configuration

#### 1.	Clone the repo

    git clone https://github.com/BJWRD/rancher-terraform-eks-cluster

#### 2.	Initialise the TF directory

    terraform init

#### 3.	 Ensure the terraform code is formatted and validated 

    terraform fmt && terraform validate

#### 4.	Create an execution plan

    terraform plan

#### 5.	Execute terraform configuration - Creating the Rancher EKS Cluster

    terraform apply --auto-approve
    
Update Image

### Further Configuration
Once the Resources have been successfully provisioned, you will then be able to configure kubectl to manage your cluster and deploy Kubernetes configurations to it.

#### 1. Configure Kubectl 

    aws eks --region eu-west-2 update-kubeconfig --name rancher-cluster
    
Enter image 

## Cluster/Node Verification Steps 

#### 1. Verify the Cluster

    kubectl cluster-info
    
Enter Image

Or check via the AWS Console GUI -

Enter the Image 

#### 2. Verify the Nodes

  kubectl get nodes -o wide
  
Enter Image

Or check via the AWS Console 

Enter Image

## Rancher App Verification Steps 

### 1.

## Teardown steps

#### 1.	Destroy the deployed AWS Infrastructure 
`terraform destroy --auto-approve`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | ~> 19.5.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Useful Links

* https://registry.terraform.io/providers/hashicorp/helm/latest/docs
