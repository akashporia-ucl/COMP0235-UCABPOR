# COMP0235-UCABPOR

## Overview

This repository contains the infrastructure and configuration for the COMP0235 UCABPOR project. It includes Terraform scripts for provisioning resources and Ansible playbooks for configuring and managing the environment.

## Repository Structure

-   ansible/: Contains Ansible playbooks and related files for configuring the environment.

    -   files/: Contains various template and script files used by the playbooks.
    -   logging/: Contains playbooks related to logging configuration.
    -   merizo/: Contains playbooks for setting up and configuring the Merizo project.
    -   minio_nfs_setup/: Contains playbooks for setting up MinIO with NFS.
    -   provision/: Contains playbooks for provisioning resources.
    -   run/: Contains playbooks for running tasks and workflows.
    -   spark/: Contains playbooks for setting up and configuring Spark.
    -   full.yml: Main playbook that includes all other playbooks.
    -   inventory.yaml: Inventory file for Ansible.

-   terraform/: Contains Terraform scripts for provisioning infrastructure.
    -   .terraform.lock.hcl: Lock file for Terraform providers.
    -   cloud-init.tmpl.yml: Cloud-init template for VM initialization.
    -   generate_inventory.py: Script to generate Ansible inventory from Terraform outputs.
    -   lecturer_key.pub: Public SSH key for the lecturer.
    -   main.tf: Main Terraform configuration file.
    -   outputs.tf: Terraform outputs configuration.
    -   providers.tf: Terraform providers configuration.
    -   terraform.tfstate: Terraform state file.
    -   terraform.tfstate.backup: Backup of the Terraform state file.
    -   variables.tf: Terraform variables configuration.
    -   versions.tf: Terraform version constraints.

## Ansible Playbooks

### MinIO Setup

-   minio_nfs_setup/p3_install_minio.yml: Installs and configures the MinIO server and client.
-   minio_nfs_setup/p4_update_minio.yml: Updates the MinIO server and client.
-   minio_nfs_setup/p5_distribute_minio_certificate.yml: Distributes the MinIO certificate to nodes.

### Merizo Project

-   merizo/p25_configure_permissions_and_environment.yml: Configures permissions and environment setup.
-   merizo/p26_setup_merizo_project.yml: Sets up the Merizo project directories and clones repositories.
-   merizo/p27_setup_merizo_algorithm_trigger.yml: Clones the Merizo repository.
-   merizo/p28_setup_output_directories.yml: Creates output directories and sets permissions.
-   merizo/p30_download_dataset_to_raw_folders.yml: Downloads datasets to raw folders.
-   merizo/p32_decompress_gz_files.yml: Decompresses .gz files.

### Running Tasks

-   run/p35_collate_results.yml: Collates results from .parsed files.
-   run/p36_put_results_to_minio.yml: Uploads results to MinIO.

## Terraform Scripts

-   main.tf: Defines the main infrastructure resources.
-   outputs.tf: Specifies the outputs of the Terraform configuration.
-   providers.tf: Configures the providers used by Terraform.
-   variables.tf: Defines the variables used in the Terraform configuration.
-   generate_inventory.py: Generates Ansible inventory from Terraform outputs.

## Usage

### Setting Up the Environment

1. Clone the repository:

    ```sh
    git clone https://github.com/akashporia-ucl/COMP0235-UCABPOR
    cd COMP0235-UCABPOR
    ```

2. Initialize and apply the Terraform configuration:

    ```sh
    cd terraform
    terraform init
    terraform apply
    ```

    Update values in variable.tf for username, ssh keys, network etc

3. Generate the Ansible inventory:

    ```sh
    python3 generate_inventory.py
    ```

4. Run the Ansible playbooks:

    ```sh
    cd ../ansible
    ansible-playbook -i inventory.yaml full.yml
    ```

5. Results (csv files) will be available in repo and can also be accessed via GUI
