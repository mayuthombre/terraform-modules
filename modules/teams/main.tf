locals {
  team_data = jsondecode(file(var.json_file))

  team_name        = local.team_data.team_name
  team_description = local.team_data.description

  maintainers = local.team_data.maintainers
  members     = local.team_data.members

  admin_repos    = local.team_data.repos.admin
  maintain_repos = local.team_data.repos.maintain
  push_repos     = local.team_data.repos.push
  triage_repos   = local.team_data.repos.triage

  uniq_members = distinct(concat(local.team_data.maintainers, local.team_data.members))
  uniq_repos   = distinct(concat(local.team_data.repos.admin, local.team_data.repos.maintain, local.team_data.repos.push, local.team_data.repos.triage))

}


resource "github_team" "team" {
  name           = local.team_name
  description    = local.team_description
  parent_team_id = var.parent_team_id # needs to be added in input json and get the id using data source
}

resource "github_team_membership" "members" {
  for_each = toset(local.uniq_members)
  team_id  = github_team.team.id
  username = "${each.key}_FuroEMU"
  role     = contains(local.maintainers, each.key) ? "maintainer" : "member"
}

resource "github_team_repository" "teams" {
  for_each   = toset(local.uniq_repos)
  team_id    = github_team.team.id
  repository = each.key
  permission = contains(local.admin_repos, each.key) ? "admin" : contains(local.maintain_repos, each.key) ? "maintain" : contains(local.push_repos, each.key) ? "push" : contains(local.triage_repos, each.key) ? "triage" : "pull"
}