variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
}

variable "region" {
  description = "Região do GCP para provisionamento"
  type        = string
  default     = "europe-west3"
}