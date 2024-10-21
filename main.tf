
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

 resource "google_compute_subnetwork" "subnet-02" {
   name          = "subnet2"
   ip_cidr_range = "10.0.2.0/24"
   region        = "europe-west10"
   network       = "vpclino"
}

resource "google_storage_bucket" "my_bucket" {
    name = "bucket-lino-unique"
    location = "us"
    storage_class = "standard"
}

resource "google_storage_bucket" "my_bucket-02" {
    name = "regional_bucket"
    location = "us"
    storage_class = "regional"
}

resource "google_sql_database_instance" "my_mysql_instance" {  
  name         = "lino-database"
  region       = "us-central1" 
  database_version = "MYSQL"
    tier = "db-n1-standard-1"
    disk_size_gb = 10 
  }
}
