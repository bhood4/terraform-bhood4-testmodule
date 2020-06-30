provider "google" { }

data "google_compute_network" "my_network" {
  name = "default"
}
data "google_compute_subnetwork" "my_subnetwork" {
  name   = "default"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = "n1-standard-2"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = data.google_compute_subnetwork.my_subnetwork.self_link
    access_config {
    }
  }
}
