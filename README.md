# Terraform Workflow with GitHub Actions

## Overview

This repository automates infrastructure deployments using **GitHub Actions**, **Terraform Cloud**, and **AWS**. The workflow handles:
- Initializing Terraform.
- Formatting Terraform configuration files.
- Validating Terraform configurations.
- Generating and uploading an execution plan.

## Prerequisites

1. **Terraform Cloud API Token**: Generate one by following [HashiCorp’s guide](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/api-tokens).
2. **AWS IAM Credentials**: Create programmatic access keys with [AWS IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html).
3. **GitHub Secrets**: Add the following secrets to your repository settings:
   - `TF_API_TOKEN`: Terraform Cloud API token.
   - `AWS_REGION`: AWS region for your resources.
   - `AWS_ACCESS_KEY_ID`: AWS access key ID.
   - `AWS_SECRET_ACCESS_KEY`: AWS secret access key.

## Workflow Overview

The workflow is defined in `.github/workflows/terraform.yml` and is triggered by:
- Push events to any branch.
- Pull requests.
- Manual runs using `workflow_dispatch`.

### Jobs

#### 1. Terraform Initialize
- Checks out the code.
- Sets up Terraform CLI.
- Configures the workspace based on the branch (production for `main`, development for others).
- Runs `terraform init`.

#### 2. Terraform Format
- Ensures code formatting using `terraform fmt -check -recursive`.

#### 3. Terraform Validate
- Validates the Terraform configuration for syntax and consistency.

#### 4. Terraform Plan
- Generates an execution plan.
- Uploads the plan as an artifact for review.

## How to Use

1. Clone the repository.
2. Configure GitHub Secrets as mentioned in the prerequisites.
3. Push changes or create a pull request to trigger the workflow.
4. Monitor progress in the **Actions** tab on GitHub.

## File Structure

```
.
├── .github
│   └── workflows
│       └── terraform.yml    # GitHub Actions workflow definition
├── main.tf                  # Main Terraform configuration file
├── variables.tf             # Variable definitions
└── README.md                # Repository documentation
```

## Additional Resources

- [Terraform Cloud API Tokens](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/api-tokens)
- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
- [GitHub Actions Documentation](https://github.com/features/actions)

## Contributing

Feel free to submit issues and pull requests for improvements or bug fixes. All contributions are welcome!

## License

This repository is licensed under the MIT License. See the `LICENSE` file for details.

