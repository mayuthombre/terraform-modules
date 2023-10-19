module "teams" {
  source       = "../../modules/teams"
  name         = "Terraform Test Team 1"
  members      = var.team_members
  owner_name   = "furo-migrations-emu"
  github_token = var.github_token
  repo_vars    = var.team_members_repos
}
