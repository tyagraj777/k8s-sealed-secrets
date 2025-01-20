# k8s-sealed-secrets
Goal: Securely manage secrets in Kubernetes by encrypting them in Git and decrypting them only within the cluster. Tools: Kubernetes, Sealed Secrets (controller for encrypting secrets), kubeseal (CLI tool), Terraform (infrastructure as code).

# Kubernetes Secrets Management with Sealed Secrets

## Overview

This project demonstrates how to manage secrets securely in Kubernetes using Sealed Secrets and Terraform. Secrets are encrypted before being committed to Git and are only decrypted within the cluster.

## Tools Used
- **Kubernetes**: For orchestration
- **Sealed Secrets**: For encrypting secrets
- **Terraform**: For infrastructure as code
- **kubeseal**: CLI tool for generating SealedSecrets

## Project Structure


![image](https://github.com/user-attachments/assets/b3ae380f-262b-4de5-a049-36f59562acc8)



## Getting Started

1. **Provision the Cluster**
   ```bash
   terraform init
   terraform apply

2. **Install Sealed Secrets**
   ```bash
    ./scripts/install-sealed-secrets.sh

3. **Encrypt Secrets Use kubeseal to encrypt secrets**
    ```bash
    kubectl create -f k8s/secrets/database-secret.yaml --dry-run=client -o yaml | \
    kubeseal --controller-namespace kube-system --format=yaml > k8s/secrets/sealed-database-secret.yaml

4. **Deploy the Application**
    ```bash
    kubectl apply -f k8s/

**Features**

Encrypted secrets committed to Git
Automated decryption by the Sealed Secrets controller
Secrets injected into applications as environment variables

Cleanup

**To destroy resources:**
 ```bash
 terraform destroy

