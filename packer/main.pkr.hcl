variable az {
  type = string
}

variable group {
  type = string
}

variable subnet {
  type = string
}

variable image_name {
  type = string
}

variable ssh_username {
  type = string
}

variable num_cores {
  type = number
}

variable instance_type {
  type = string
}

packer {
  required_plugins {
    oracle = {
      version = ">= 1.0.5"
      source  = "github.com/hashicorp/oracle"
    }
  }
}

source "oracle-oci" "main" {
  availability_domain = var.az
  compartment_ocid    = var.group
  subnet_ocid         = var.subnet
  image_name          = var.image_name
  shape               = var.instance_type
  shape_config {
    ocpus = var.num_cores
  }
  base_image_filter {
    display_name_search = "Oracle-Linux-8*"
  }
  ssh_username        = var.ssh_username
}

build {
  sources = ["source.oracle-oci.main"]
  provisioner "file" {
    source = "../.env"
    destination = "~/.env"
  }
  provisioner "shell" {
    script = "../packer/install.sh"
  }
}