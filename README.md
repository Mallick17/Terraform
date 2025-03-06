# Terraform
**So what is Terraform?** Terraform is an infrastructure as code tool that streamlines the process of building, modifying, and versioning cloud and on-premises resources. Developed by HashiCorp, this powerful tool allows users to define their infrastructure in human-readable configuration files, facilitating efficient management and automation of resources through a declarative approach.

You can achieve a switchable tab-like interface in a GitHub README using HTML and JavaScript. Below is the markdown code with embedded HTML and JavaScript to create tabs for installation instructions on different Linux distributions.


# Install Terraform

## Installation Methods

- [Manual installation](#)
- [Homebrew on macOS](#)
- [Chocolatey on Windows](#)
- [Linux](#)

## Linux Installation

HashiCorp officially maintains and signs packages for the following Linux distributions.

<div>
  <button onclick="showTab('ubuntu')" class="tab-button">Ubuntu/Debian</button>
  <button onclick="showTab('rhel')" class="tab-button">CentOS/RHEL</button>
  <button onclick="showTab('fedora')" class="tab-button">Fedora</button>
  <button onclick="showTab('amazon')" class="tab-button">Amazon Linux</button>
</div>

<div id="ubuntu" class="tab-content">
  **Ubuntu/Debian**
  
  Ensure that your system is up to date and you have installed the necessary packages:
  
  ```sh
  sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
  ```

  Install the HashiCorp GPG key:
  
  ```sh
  wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
  ```

  Verify the key's fingerprint:
  
  ```sh
  gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint
  ```
</div>

<div id="rhel" class="tab-content" style="display:none;">
  **CentOS/RHEL**
  
  Install the required dependencies:
  
  ```sh
  sudo yum install -y yum-utils
  ```

  Add the HashiCorp repository:
  
  ```sh
  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
  ```

  Install Terraform:
  
  ```sh
  sudo yum install -y terraform
  ```
</div>

<div id="fedora" class="tab-content" style="display:none;">
  **Fedora**
  
  Install the required dependencies:
  
  ```sh
  sudo dnf install -y dnf-plugins-core
  ```

  Add the HashiCorp repository:
  
  ```sh
  sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
  ```

  Install Terraform:
  
  ```sh
  sudo dnf install -y terraform
  ```
</div>

<div id="amazon" class="tab-content" style="display:none;">
  **Amazon Linux**
  
  Install the required dependencies:
  
  ```sh
  sudo yum install -y yum-utils
  ```

  Add the HashiCorp repository:
  
  ```sh
  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
  ```

  Install Terraform:
  
  ```sh
  sudo yum install -y terraform
  ```
</div>

<style>
  .tab-button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 8px 16px;
    margin: 5px;
    cursor: pointer;
    border-radius: 5px;
  }
  .tab-button:hover {
    background-color: #0056b3;
  }
  .tab-content {
    border: 1px solid #ddd;
    padding: 10px;
    margin-top: 10px;
    border-radius: 5px;
    background-color: #f8f9fa;
  }
</style>

<script>
  function showTab(tabId) {
    document.querySelectorAll('.tab-content').forEach(div => {
      div.style.display = 'none';
    });
    document.getElementById(tabId).style.display = 'block';
  }
</script>
```

### How It Works:
- This script uses HTML buttons to switch between installation instructions for different Linux distributions.
- JavaScript hides all tabs except the selected one.
- CSS styles the buttons and content for better readability.

Since GitHub README does not support inline JavaScript, you may need to host this on a GitHub Pages site or use a different markdown renderer that allows JavaScript. Otherwise, you can provide separate sections for each OS without tabs.

Would you like me to modify it for plain GitHub markdown compatibility?
# Terraform Project

This project demonstrates a Terraform architecture setup.

## Terraform File Architecture

Below is a visual representation of the Terraform file architecture:

![Terraform File Architecture](Terraform%20File%20Architecture.drawio.png)

## Features

- Modular file structure.
- Reusable Terraform modules.
- Environment-specific configurations.

## Usage

1. Clone this repository.
2. Update the variables as needed.
3. Apply the Terraform configuration:
   ```bash
   terraform init
   terraform apply

