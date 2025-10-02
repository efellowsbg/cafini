variable "global_settings" {
  description = "Global settings for cafini"
  type        = map(any)
  default     = {}
}

variable "settings" {
  description = "All the configuration for this resource"
  type        = map(any)
  default     = {}
}

variable "resources" {
  description = "All required resources"
  type        = any
  default     = {}
}
