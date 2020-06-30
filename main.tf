provider "google" { }

resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = "n1-standard-2"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
}
