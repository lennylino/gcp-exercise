
terraform {
   required_providers {
     google = {
       source  = "hashicorp/google"
       version = "~> 4.0"
     }
   }
 }

 provider "google" {
  project = "project-lino-433318"
  region  = "us-central1"
  credentials = file("project-lino-433318-f9d2ebc05e57.json")
 }

 resource "google_compute_instance" "lino-vm1" {
  name         = "lino-vm1"
  machine_type = "e2-micro"         
    zone         = "us-central1-a"    

 boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
        subnetwork = "subnet2"


    access_config { 
    }
  }
 }

provider "google" {
  project = "project-lino-433318"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpclino"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet1"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
    network     = "vpclino"
}
