variable "project_id" {
  description = "The Scaleway project ID"
  type        = string
}

variable "access_key" {  
    type = string  
    sensitive = true
}

variable "secret_key" {  
    type = string  
    sensitive = true
}

variable "organization_id" {  
    type = string  
    sensitive = true
}

variable "region" {
  description = "The Scaleway region for the object storage bucket"
  type        = string
  default     = "nl-ams"

  validation {
    condition     = contains(["fr-par", "nl-ams", "pl-waw"], var.region)
    error_message = "Region must be one of: fr-par, nl-ams, pl-waw"
  }
}

variable "zone" {
  description = "The Scaleway zone"
  type        = string
  default     = "nl-ams-1"
}

variable "bucket_name" {
  description = "The name of the object storage bucket (must be globally unique)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be 3-63 characters, start and end with lowercase letter or number, and contain only lowercase letters, numbers, and hyphens"
  }
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "enable_versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "acl" {
  description = "The canned ACL to apply to the bucket (private, public-read, public-read-write, authenticated-read)"
  type        = string
  default     = "private"

  validation {
    condition     = var.acl == null || contains(["private", "public-read", "public-read-write", "authenticated-read"], var.acl)
    error_message = "ACL must be one of: private, public-read, public-read-write, authenticated-read, or null"
  }
}

variable "cors_rules" {
  description = "List of CORS rules to apply to the bucket"
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    max_age_seconds = number
  }))
  default = []
}
