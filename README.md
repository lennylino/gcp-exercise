# gcp-exercise
# Description

## TG DELTA1 END OF TRAINING EXERCISE

## GitHub Repository
- A new GitHub repository was created and named  "gcp-exercise".
- A README.md file  was added to the repository and the default branch was set to "main"

## VPC NETWORK(VIRTUAL PRIVATE CLOUD)
- A vpc network named (vpclino) was created with 2 subnets in different regions using terraform  as follows: 
provider "google" {
  project = "project-lino-433318"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpclino"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

resource "google_compute_subnetwork" "subnet-02" {
  name          = "subnet-02"
  ip_cidr_range = "10.0.2.0/24"
  region        = "europe-west10"
}
- Firewall rules were configured to allow HTTP/HTTPS traffic .
- SSH access was allowed as well. Both steps for firewall rule were done on the console.

## Compute Engine virtual machine instances
- Using terraform, two (2) compute engine virtual machine instances were created for the two(2) subnets in the vpcnetwork(vpclino) created above.
resource "google_compute_instance" "vm1" {
  name         = "linovm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  network_interface {
    subnetwork = (subnet1)
  }
}

resource "google_compute_instance" "lino-vm" {
  name         = "lino-vm"
  machine_type = "e2-micro"
  zone         = "europe-west10"
  network_interface {
    subnetwork = (subnet2)
  }
}
## Identity and Access management (IAM)
- Compute network admin  and computer admin roles were granted to abel@nexedgetechnologies.com.
- This was done through the console by editing the user and adding both roles.

## Database
- A CloudSQL(mysql) database instance was setup through the console with edition preset: develepment.
- A database instance with instance ID (lino-database) was created within the instance.
- In the gcp console, Cloudshell was activated and the following command was run to connect to the "lino-database" instance : gcloud sql connect lino-database --user=root
- A password which was already generated upon creation was inputed.
- To create a table within the database, the following steps were taken:
- A new database named my_db was created using the command: CREATE DATABASE my_db;
- The new database was used through the command: use my_db
- The table was then created using the following command: CREATE TABLE students ( id INT NOT NULL AUTO_INCREMENT, name
VARCHAR(100), age INT, PRIMARY KEY (id) );
- After creation, the sample data was inserted into the table using the commad: INSERT INTO students (name, age) VALUES ('John Doe', 22); INSERT INTO students
(name, age) VALUES ('lino lenny', 21);


## Linux
- On the first vm instance created (linovm), mastery of basic linux commands was shown by doing the following:
- Five(5) folders were created and 1 txt.file was added in each one of them
- Commands used were: 
- To create the folders: "mkdir folder1 folder2 folder3 folder4 folder5"
- To add one txt.file to each folder:
"touch folder1/file.txt
touch folder2/file.txt
touch folder3/file.txt
touch folder4/file.txt
touch folder5/file.txt"

- A sample python flask app was deployed in the first folder; having already installed python and flask using the following codes respectively
sudo apt install python3 python3-pip -y
sudo apt install python3-flask
- A flask directory was created within the folder using the command: mkdir flask-app cd flask-app
- A simple python file was created using the command:touch app.py
- After inputing the code to be deployed within the flask app using the commad:nano app.py
- The flask app was then deployed using the code: sudo python3app.py