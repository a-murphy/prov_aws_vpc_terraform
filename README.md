Provision a GKE cluster using Terraform

Integrations:
  * githubIntegration: A GitHub integration
  * googleCloudIntegration: A Google Cloud integration

Resources:
  * terraform_scripts_repository: This repository, with the Terraform configuration files.
  * terraform_info: A resource to store some information about the created cluster for use in other steps.

Pipelines:
  * Terraform: Contains the steps to provision and deprovision the cluster
      * provision_GKE_cluster: Copies the terraform.tfstate file from the pipeline state if there is one, uses Terraform to create the cluster, saves the terraform.tfstate file in the pipeline state, and updates terraform_info with some information about the cluster.
      * deprovision_GKE_cluster: Copies the terraform.tfstate file from the pipeline state, uses Terraform to destroy the cluster, saves the terraform.tfstate file in the pipeline state,
  * Requires_Terraform: Another pipeline containing a step that connects to the cluster and lists the nodes in the cluster.
