module "test-team-1" {
  source       = "../../modules/teams"

  for_each     = var.team_var
  name         = each.key
  members      = each.value
}
