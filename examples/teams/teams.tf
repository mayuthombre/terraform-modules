# module "team_red" {
#   source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=tf/json"
#   name         = "red2"
#   json_file    = "team_members.json"
#   owner_name   = "furo-migrations-emu"
#   github_token = var.github_token
# }

# module "team_blue" {
#   source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=tf/json"
#   name         = "blue2"
#   json_file    = "team_members.json"
#   owner_name   = "furo-migrations-emu"
#   github_token = var.github_token
# }

module "team_red" {
  #source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=tf/json"
  source       = "../../modules/teams"
  json_file    = "team_red.json"
  owner_name   = "furo-migrations-emu"
  github_token = var.github_token
}
