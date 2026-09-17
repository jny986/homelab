terraform {
  required_version = ">= 1.5"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66"
    }
  }
}

variable "proxmox_api_url" {
  description = "Proxmox API endpoint, e.g. https://pve.example.com:8006/"
  type        = string
  default     = "https://pve.invalid:8006/"
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
}

# Placeholder data source so `terraform validate` / `tflint` have something to
# check. Replace with real guest resources in a later ticket.
data "proxmox_version" "this" {}
