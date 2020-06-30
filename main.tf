provider "google" { }

data "google_compute_network" "my_network" {
  name = "default"
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.3.0.0/16"
  network       = data.google_compute_network.my_network.self_link
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
    subnetwork = google_compute_subnetwork.my_subnetwork.self_link
  }
}
