locals {
  team_members = jsondecode(file(var.json_file))
}

resource "github_team" "team" {
  name           = var.name
  description    = var.description
  parent_team_id = var.parent_team_id
}

resource "github_team_membership" "members" {
  for_each = {
    for username in concat(
      local.team_members.maintainers,
      local.team_members.members
    ) : username => username
  }
  team_id  = github_team.team.id
  username = each.key
  role     = contains(local.team_members.maintainers, each.key) ? "maintainer" : var.default_role
}
