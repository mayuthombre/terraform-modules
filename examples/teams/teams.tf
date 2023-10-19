module "test-team-1" {

  source = "../../modules/teams"
  name    = "Test Team 1"
  members = []
  github_token   = var.github_token
}
