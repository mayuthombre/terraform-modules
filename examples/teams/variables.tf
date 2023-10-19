variable "github_token" {
  description = "Token used to apply configuration changes"
  type        = string
}

variable "team_members" {
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

variable "team_members_repos" {
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