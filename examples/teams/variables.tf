variable "github_token" {
  description = "GitHub access token used to configure the provider"
  type        = string
}

variable "team_var" {
  type = map(list(object({
    username = string
    role     = optional(string)
  })))
  default     = {}
}
