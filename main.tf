locals {
  project_id = var.project_id
}

provider "google" {
  project = local.project_id
  region  = "us-central1"
  zone = "us-central1-b"
}

resource "google_project_service" "compute_service" {
  project = local.project_id
  service = "compute.googleapis.com"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform"
  machine_type = "f1-micro"

  tags = ["terraform"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20210420"
    }
  }

  network_interface {
    network = "default" # Assuming you want to use the default network
    # You can add more configuration options here as needed
  }
}
