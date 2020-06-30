provider "google" { }

resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = "n1-standard-2"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    #network       = "default"
    network       = "random-ip-range-pods"
    access_config {
    }
  }
}
