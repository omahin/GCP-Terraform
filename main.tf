provider "google" {
  project = var.project_id
  region  = "europe-west3"
}

# Definição da Instância de Computação (VM) no GCP
resource "google_compute_instance" "vm_instance" {
  name         = "instance-new-20241028"  
  machine_type = "e2-micro"                  
  zone         = "europe-west3-a"            

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"       
    }
  }

  network_interface {
    network = "default"
    access_config {}                         
  }

  tags = ["http-server"]
}

# Bucket para armazenar o código da função
resource "google_storage_bucket" "function_bucket" {
  name          = "${var.project_id}-function-bucket"
  location      = "EU"
  force_destroy = true
}

# Upload do arquivo ZIP para o bucket
resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "/home/olga_mahin/terraform-gcp-project/function/function-source.zip"
}

# Função HTTP no GCP
resource "google_cloudfunctions_function" "http_function" {
  name                  = "minha-funcao-http"
  description           = "Função HTTP simples"
  runtime               = "nodejs14"
  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_zip.name
  entry_point           = "helloWorld"
  trigger_http          = true
  timeout               = 60
}