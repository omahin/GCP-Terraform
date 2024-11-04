output "function_url" {
  description = "URL da Função Cloud HTTP"
  value       = google_cloudfunctions_function.http_function.https_trigger_url
}