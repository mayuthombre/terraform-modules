module "test-team-1" {
  source = "../../modules/teams"

  name    = "Test Team 1"
  members = []
}

#module "test-team-2" {
#  source = "../../modules/teams"
#
#  name = "Test Team 2"
#  members = [
#    {
#      username = navuluris,
#    },
#  ]
#  parent_team_id = module.test-team-1.id
#}

#module "test-team-3" {
#  source = "../../modules/teams"
#
#  name = "Test Team 2"
#  members = [
#    {
#      username = github_membership.fssalim.username,
#    },
#  ]
#  parent_team_id = module.test-team-2.id
#}
