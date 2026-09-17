packer {
  required_plugins {
    proxmox = {
      source  = "github.com/hashicorp/proxmox"
      version = "~> 1.2"
    }
  }
}

variable "proxmox_api_url" {
  type    = string
  default = "https://pve.invalid:8006/api2/json"
}

variable "proxmox_api_token" {
  type      = string
  default   = "placeholder"
  sensitive = true
}

# Placeholder Debian 12 cloud-init template build. Real config (Ceph-backed
# storage, cloud-init settings, ISO/image source) lands in a later ticket.
source "proxmox-iso" "debian12" {
  proxmox_url              = var.proxmox_api_url
  username                 = "packer@pve!packer"
  token                    = var.proxmox_api_token
  insecure_skip_tls_verify = true
  node                     = "placeholder"

  boot_iso {
    iso_url          = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
    iso_checksum     = "none"
    iso_storage_pool = "local"
  }

  vm_name       = "debian-12-template"
  template_name = "debian-12-template"

  ssh_username = "packer"

  boot_wait = "5s"
}

build {
  sources = ["source.proxmox-iso.debian12"]
}
