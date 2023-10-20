# variable "members" {
#   type = list(object({
#     username = string
#     role     = optional(string)
#   }))
#   default = []
#   description = <<EOT
#   List of members for the team and their role. For each member:
#     - username: Github username.
#     - role: (optional) the role granted to the team member. One of
#         - member (default)
#         - maintainer
#   EOT
# }

variable "json_file" {
  description = "Path to the JSON file containing team members."
  type        = string
  default     = null
}

variable "name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "parent_team_id" {
  type    = number
  default = null
}

variable "github_token" {
  description = "GitHub access token used to configure the provider"
  type        = string
}

variable "owner_name" {
  description = "Oganisation name where team will be created"
  type        = string
}

variable "default_role" {
  description = "Default role for team members if not specified in the JSON."
  type        = string
  default     = "member"
}