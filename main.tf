
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
  credentials = file("")
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
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet1"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = "vpclino"
}

 resource "google_compute_subnetwork" "subnet-02" {
   name          = "subnet2"
   ip_cidr_range = "10.0.2.0/24"
   region        = "europe-west10"
   network       = "vpclino"
}
