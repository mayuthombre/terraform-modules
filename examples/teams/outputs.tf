# output "outvpc_id" {
#   value = "${aws_vpc.moduleVPC.id}"
# }

output "test_data" {
  value = module.team_red.team_data
}

output "team_name" {
  value = module.team_red.team_name
}

output "maintainers" {
  value = module.team_red.maintainers
}

output "members" {
  value = module.team_red.members
}

output "admin_repos" {
  value = module.team_red.admin_repos
}

output "write_repos" {
  value = module.team_red.write_repos
}

output "maintain_repos" {
  value = module.team_red.maintain_repos
}

output "triage_repos" {
  value = module.team_red.triage_repos
}

output "uniq_members" {
  value = module.team_red.uniq_members
}

output "uniq_repos" {
  value = module.team_red.uniq_repos
}
