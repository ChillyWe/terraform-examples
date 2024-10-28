Welcome to the **Terraform Examples** repository! This repository contains a collection of basic Terraform scripts to help deepen understanding of Terraform by exploring real-world scenarios.

## Table of Contents

- [Overview](#overview)
- [Projects](#projects)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [License](#license)

## Overview

The aim of this repository is to provide simple, modular Terraform examples to help with learning and exploring the infrastructure-as-code (IaC) paradigm. By working through these examples, users will gain a deeper understanding of Terraform’s core concepts and its practical applications in cloud infrastructure.

## Projects

Each project is stored in its own directory within this repository:

1. **create-aws-sandbox-account**:
   - **Description**: A basic configuration to create an AWS sandbox account.
   
2. **learn-terraform-docker-container**:
   - **Description**: Deploys a simple Docker container to get familiar with using Terraform for containerized applications.

3. **learn-terraform-aws-instance**:
   - **Description**: Launches a single AWS EC2 instance, covering basic AWS instance provisioning via Terraform.

## Getting Started

### Prerequisites

To use the examples in this repository, you'll need:
- **Terraform**: Install [Terraform](https://www.terraform.io/downloads) (version 1.0 or later).
- **AWS CLI**: If working with AWS projects, install and configure the [AWS CLI](https://aws.amazon.com/cli/).
- **Docker**: Install [Docker](https://www.docker.com/get-started) if you are working on the Docker example.

### Clone the Repository

Clone this repository to your local machine to get started:

```bash
git clone https://github.com/ChillyWe/terraform-examples.git
cd terraform-examples
```

### Usage

Each project is independent and can be run separately. Follow these general steps:

Navigate to the project directory:
``` bash

cd create-aws-sandbox-account  # or choose another project directory
```

Initialize the Terraform configuration:
```bash
terraform init
```

Plan the deployment to review changes:
```bash
terraform plan
```

Apply the configuration to deploy resources:
```bash
terraform apply
```

Destroy resources after testing:
```bash
terraform destroy
```
    
>Note: Be sure to adjust any variables in the main.tf file if needed, or provide them as input during terraform apply.



License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See the LICENSE file for details.

Happy Terraforming!