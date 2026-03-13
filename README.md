# TF-AWS Project

This repository contains Terraform configurations for managing AWS resources across different services.

## Directory Structure

- **aws-ec2/**: Contains Terraform configurations for managing EC2 instances.
  - \`main.tf\`: Main configuration file for EC2.
  - \`dummy.tf\`: Example or placeholder Terraform file for EC2 testing.
  - \`terraform.tfstate\`: Terraform state file for EC2.
  - \`terraform.tfstate.backup\`: Backup of the Terraform state file.

- **aws-s3/**: Contains Terraform configurations for managing S3 buckets.
  - \`main.tf\`: Main configuration file for S3.
  - \`myfile.txt\`: Additional file related to S3 configurations.

- **aws-vpc/**: Contains Terraform configurations for managing VPCs.
  - \`main.tf\`: Main configuration file for VPC.

- **aws-vpc-ngnix/**: VPC + NGINX/EC2 Terraform module for testing web servers.
  - \`providers.tf\`: Provider configuration.
  - \`vpc.tf\`: VPC and networking resources.
  - \`security_groups.tf\`: Security group rules for EC2/NGINX.
  - \`ec2.tf\`: EC2 instance definitions (NGINX server).
  - \`main.tf\`: High-level module composition.
  - \`output.tf\`: Outputs for the module.
  - \`terraform.tfstate\` / \`terraform.tfstate.backup\`: Local Terraform state files.

- **Ecommerce-project/**: Contains configurations for deploying an ecommerce static site to S3.
  - \`index.html\`: Main HTML file for the ecommerce site.
  - \`main.tf\`: Main configuration file for S3 bucket and website hosting.
  - \`script.js\`: JavaScript file for ecommerce functionality.
  - \`style.css\`: CSS file for styling the ecommerce website.

- **practice-tf/**: Contains practice Terraform configurations.
  - \`ec2/\`: Subdirectory with EC2 practice configurations.
    - \`main.tf\`: Practice configuration file for EC2.
  - \`aws-vpc/\`: Subdirectory with VPC practice configurations.
    - \`main.tf\`: Practice configuration file for VPC with subnets, internet gateway, and route tables.

- **proj-static-website/**: Contains configurations for deploying a static website.
  - \`index.html\`: Main HTML file for the static website.
  - \`main.tf\`: Main configuration file for the static website.
  - \`styles.css\`: CSS file for styling the static website.

- **remote-infra/**: Basic AWS resources including S3 bucket and DynamoDB table (eu-west-1).
  - \`terraform.tf\`: Required providers (aws 6.35.1).
  - \`provider.tf\`: AWS provider config.
  - \`s3.tf\`: S3 bucket \"saurav-infra-bucket\".
  - \`dynamodb.tf\`: DynamoDB table \"saurav-remote-infra-table\".

- **data-source/**: Contains Terraform configurations for AWS data sources.
  - \`main.tf\`: Main configuration file for data source queries.

- **tf-variable/**: Contains Terraform variable definitions and configurations.
  - \`main.tf\`: Main configuration file.
  - \`variable.tf\`: Variable definitions.
  - \`terraform.tfvars\`: Terraform variable values.

- **tf-jenkins/**: Contains Terraform configurations for deploying Jenkins on AWS EC2.
  - \`mian.tf\`: Main configuration file with security group (SSH port 22, Jenkins port 8080) and EC2 instance.
  - \`variable.tf\`: Variable definitions for aws_region, ami_id, instance_type, and key_name.
  - \`output.tf\`: Outputs for jenkins_public_ip and jenkins_url.
  - \`user_data.sh\`: Bash script to install Jenkins with Java 11 on Ubuntu.

- **aws-eks/**: Terraform configurations for deploying an EKS cluster with VPC networking.
  - \`provider.tf\`: AWS and TLS providers with locals for eu-west-1 VPC config.
  - \`vpc.tf\`: VPC module with public/private/intra subnets.
  - \`eks.tf\`: EKS module (terraform-aws-modules/eks/aws) with managed node groups for jobportal-demo.
  - \`variable.tf\`: Variables for region, AMI, etc.
  - \`output.tf\`: Outputs for cluster endpoint, VPC ID, node IPs.

## Getting Started

To get started with this project, ensure you have Terraform installed on your machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).

### Prerequisites

- AWS account with appropriate permissions to create resources.
- Terraform installed (version 1.0 or higher recommended).

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd TF-AWS
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```

### Configuration

- Modify the \`main.tf\` files in each directory to customize the resources according to your needs.

### Deployment

To deploy the resources, run:

```bash
terraform apply
```

### Cleanup

To destroy the resources created by Terraform, run:

```bash
terraform destroy
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License.

