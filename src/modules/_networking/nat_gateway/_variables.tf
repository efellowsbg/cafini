variable "global_settings" {
  description = "Global configuration (tags, inheritance, etc.)"
  type        = map(any)
  default     = {}
}

variable "settings" {
  description = "All the configuration for this resource (per instance from for_each)"
  type        = map(any)
  default     = {}
}

variable "resources" {
  description = "References to other CAF-managed resources (maps of IDs, ARNs, etc.)"
  type        = any
  default     = {}
}
