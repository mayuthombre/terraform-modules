resource "github_team" "team" {
  name           = var.name
  description    = var.description
  parent_team_id = var.parent_team_id
}

resource "github_team_membership" "members" {
  for_each = { for member in var.members : member.username => member }
  team_id  = github_team.team.id
  username = each.value.username
  role     = each.value.role == null ? "member" : each.value.role
}
