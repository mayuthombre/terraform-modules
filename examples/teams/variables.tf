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
