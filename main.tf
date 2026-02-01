terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0"
}

provider "scaleway" {
    access_key      = var.access_key
    secret_key      = var.secret_key
    organization_id = var.organization_id
    project_id      = var.project_id
    zone            = var.zone
    region          = var.region
}

resource "scaleway_object_bucket" "main" {
  name       = var.bucket_name
  region     = var.region
  project_id = var.project_id

  tags = var.tags

  # Optional: Enable versioning
  versioning {
    enabled = var.enable_versioning
  }

  # Optional: CORS configuration
  dynamic "cors_rule" {
    for_each = var.cors_rules
    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}

# Optional: ACL for the bucket
resource "scaleway_object_bucket_acl" "main" {
  count  = var.acl != null ? 1 : 0
  bucket = scaleway_object_bucket.main.name
  region = var.region
  acl    = var.acl
}
