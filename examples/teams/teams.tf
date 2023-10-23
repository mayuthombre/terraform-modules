module "team_black" {
  #source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=tf/json"
  source       = "../../modules/teams"
  json_file    = "team_black.json"
  owner_name   = "furo-migrations-emu"
  github_token = var.github_token
}

module "team_orange" {
  #source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=tf/json"
  source       = "../../modules/teams"
  json_file    = "team_orange.json"
  owner_name   = "furo-migrations-emu"
  github_token = var.github_token
}

module "team_white" {
  #source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=tf/json"
  source       = "../../modules/teams"
  json_file    = "team_white.json"
  owner_name   = "furo-migrations-emu"
  github_token = var.github_token
}