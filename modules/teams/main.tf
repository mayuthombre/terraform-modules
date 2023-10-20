locals {
  team_data = jsondecode(file(var.json_file))

  team_name = local.team_data.name

  maintainers = local.team_data.maintainers
  members = local.team_data.members

  admin_repos = local.team_data.repos.admin
  maintain_repos = local.team_data.repos.maintain
  write_repos = local.team_data.repos.write
  triage_repos = local.team_data.repos.triage

  uniq_members = distinct(concat(local.team_data.maintainers,local.team_data.members))
  uniq_repos = distinct(concat(local.team_data.repos.admin,local.team_data.repos.maintain,local.team_data.repos.write,local.team_data.repos.triage))
  #uniq_repos = distinct(local.team_data.repos[*].*)

}


resource "github_team" "team" {
  name           = local.team_name
  description    = var.description
  parent_team_id = var.parent_team_id # needs to be added in input json and get the id using data source
}

resource "github_team_membership" "members" {
  for_each = toset(local.uniq_members)
  team_id  = github_team.team.id
  username = "${each.key}_FuroEMU"
  role     = contains(local.maintainers, each.key) ? "maintainer" : var.default_role
}

resource "github_team_repository" "teams" {
  for_each   = toset(local.uniq_repos)
  team_id    = github_team.team.id
  repository = each.key
  permission =  contains(local.admin_repos, each.key) ? "admin" : contains(local.maintain_repos, each.key) ? "maintain" : contains(local.write_repos, each.key) ? "write" : contains(local.triage_repos, each.key) ? "triage" : "pull"
}