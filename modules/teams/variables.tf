variable "members" {
  type = list(object({
    username = string
    role     = optional(string)
  }))
  default = []
  description = <<EOT
  List of members for the team and their role. For each member:
    - username: Github username.
    - role: (optional) the role granted to the team member. One of
        - member (default)
        - maintainer
  EOT
}

variable "name" {
  type = string
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
  type = string
}

variable "repo_vars" {
  type = list(object({
    reponame = string
    permission = optional(string)
  }))
  default = []
  description = <<EOT
  List of repos to be added for the team and its permissions. For each repo:
    - reponame: Github repository name.
    - permissions: Permission to be granted on that repository for the team
        - pull (default)
        - maintain
  EOT
}
