variable "global_settings" {
  description = "Global settings for cafini"
}

variable "settings" {
  description = "All the configuration for this resource"
}

# variable "client_config" {
#   description = "Client config such as current landingzone key"
#   type = object({
#     landingzone_key = string
#   })
# }