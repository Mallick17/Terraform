# Terraform
**So what is Terraform?** Terraform is an infrastructure as code tool that streamlines the process of building, modifying, and versioning cloud and on-premises resources. Developed by HashiCorp, this powerful tool allows users to define their infrastructure in human-readable configuration files, facilitating efficient management and automation of resources through a declarative approach.

# Install Terraform

## Choose your operating system:

<div>
  <button onclick="showTab('ubuntu')">Ubuntu/Debian</button>
  <button onclick="showTab('rhel')">CentOS/RHEL</button>
  <button onclick="showTab('fedora')">Fedora</button>
  <button onclick="showTab('amazon')">Amazon Linux</button>
  <button onclick="showTab('macos')">macOS</button>
  <button onclick="showTab('windows')">Windows</button>
</div>

<div id="ubuntu" class="tab-content">
  <h3>Ubuntu/Debian</h3>
  <p>Ensure that your system is up to date and you have installed the `gnupg`, `software-properties-common`, and `curl` packages installed. You will use these packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.</p>
  <pre><code>$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common</code></pre>
  <p>Install the HashiCorp GPG key.</p>
  <pre><code>$ wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null</code></pre>
  <p>Verify the key's fingerprint.</p>
  <pre><code>$ gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint</code></pre>
</div>

<div id="rhel" class="tab-content" style="display:none;">
  <h3>CentOS/RHEL</h3>
  <p>Instructions for CentOS/RHEL...</p>
</div>

<div id="fedora" class="tab-content" style="display:none;">
  <h3>Fedora</h3>
  <p>Instructions for Fedora...</p>
</div>

<div id="amazon" class="tab-content" style="display:none;">
  <h3>Amazon Linux</h3>
  <p>Instructions for Amazon Linux...</p>
</div>

<div id="macos" class="tab-content" style="display:none;">
  <h3>macOS</h3>
  <p>Instructions for macOS...</p>
</div>

<div id="windows" class="tab-content" style="display:none;">
  <h3>Windows</h3>
  <p>Instructions for Windows...</p>
</div>

<script>
function showTab(tabName) {
  var i, tabContent, buttons;
  tabContent = document.getElementsByClassName("tab-content");
  for (i = 0; i < tabContent.length; i++) {
    tabContent[i].style.display = "none";
  }
  buttons = document.getElementsByTagName("button");
  for (i = 0; i < buttons.length; i++) {
    buttons[i].className = buttons[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  event.currentTarget.className += " active";
}
</script>

<style>
button {
  padding: 10px;
  margin: 5px;
  cursor: pointer;
}
.tab-content {
  display: none;
  padding: 20px;
  border: 1px solid #ccc;
}
</style>


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

