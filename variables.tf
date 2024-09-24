
variable "application_key" {
  description = "The application key for the OVH provider"
  type        = string
  sensitive   = true
}

variable "application_secret" {
  description = "The application secret for the OVH provider"
  type        = string
  sensitive   = true
}

variable "consumer_key" {
  description = "The consumer key for the OVH provider"
  type        = string
  sensitive   = true
}

variable "suffix" {
  type    = string
  default = "david"
}

variable "front_ip" {
  type = list(string)
  default = ["192.168.42.2","192.168.42.3", "192.168.42.4"]
}

