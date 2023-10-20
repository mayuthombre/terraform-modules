variable "github_token" {
  description = "Token used to apply configuration changes"
  type        = string
}

variable "json_file" {
  description = "Path to the JSON file containing team members."
  type        = string
  default     = null
}
