output "bucket_name" {
  description = "The name of the created bucket"
  value       = scaleway_object_bucket.main.name
}

output "bucket_id" {
  description = "The ID of the created bucket"
  value       = scaleway_object_bucket.main.id
}

output "bucket_region" {
  description = "The region of the created bucket"
  value       = scaleway_object_bucket.main.region
}

output "bucket_endpoint" {
  description = "The endpoint URL of the bucket"
  value       = scaleway_object_bucket.main.endpoint
}

output "bucket_api_endpoint" {
  description = "The API endpoint of the bucket"
  value       = "https://s3.${var.region}.scw.cloud"
}
