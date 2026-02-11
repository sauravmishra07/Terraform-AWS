# TF-AWS Project

This repository contains Terraform configurations for managing AWS resources across different services.

## Directory Structure

- **aws-ec2/**: Contains Terraform configurations for managing EC2 instances.
  - `main.tf`: Main configuration file for EC2.
  - `dummy.tf`: Example or placeholder Terraform file for EC2 testing.
  - `terraform.tfstate`: Terraform state file for EC2.
  - `terraform.tfstate.backup`: Backup of the Terraform state file.

- **aws-s3/**: Contains Terraform configurations for managing S3 buckets.
  - `main.tf`: Main configuration file for S3.
  - `myfile.txt`: Additional file related to S3 configurations.

- **aws-vpc/**: Contains Terraform configurations for managing VPCs.
  - `main.tf`: Main configuration file for VPC.

- **aws-vpc-ngnix/**: VPC + NGINX/EC2 Terraform module for testing web servers.
  - `providers.tf`: Provider configuration.
  - `vpc.tf`: VPC and networking resources.
  - `security_groups.tf`: Security group rules for EC2/NGINX.
  - `ec2.tf`: EC2 instance definitions (NGINX server).
  - `main.tf`: High-level module composition.
  - `output.tf`: Outputs for the module.
  - `terraform.tfstate` / `terraform.tfstate.backup`: Local Terraform state files.

- **Ecommerce-project/**: Contains configurations for deploying an ecommerce static site to S3.
  - `index.html`: Main HTML file for the ecommerce site.
  - `main.tf`: Main configuration file for S3 bucket and website hosting.
  - `script.js`: JavaScript file for ecommerce functionality.
  - `style.css`: CSS file for styling the ecommerce website.

- **practice-tf/**: Contains practice Terraform configurations.
  - `ec2/`: Subdirectory with EC2 practice configurations.
    - `main.tf`: Practice configuration file for EC2.

- **proj-static-website/**: Contains configurations for deploying a static website.
  - `index.html`: Main HTML file for the static website.
  - `main.tf`: Main configuration file for the static website.
  - `styles.css`: CSS file for styling the static website.

- **data-source/**: Contains Terraform configurations for AWS data sources.
  - `main.tf`: Main configuration file for data source queries.

- **tf-variable/**: Contains Terraform variable definitions and configurations.
  - `main.tf`: Main configuration file.
  - `variable.tf`: Variable definitions.
  - `terraform.tfvars`: Terraform variable values.

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

- Modify the `main.tf` files in each directory to customize the resources according to your needs.

### Deployment

To deploy the resources, run:

```bash
tf apply
```

### Cleanup

To destroy the resources created by Terraform, run:

```bash
tf destroy
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License.
