# output "id" {
#   description = "Numeric ID of the team, used to reference this team in other modules."
#   value       = github_team.team.id
# }

# output "name" {
#   value = var.name
# }

  # team_data = jsondecode(file(var.json_file))
  # team_name = local.team_data.name
  # maintainers = local.team_data.maintainers
  # members = local.team_data.members
  # uniq_members = distinct(concat(maintainers,members))

output "test_data" {
    value = "testing"
}


output "team_data" {
    value = local.team_data
}

output "team_name" {
    value = local.team_name
}

output "maintainers" {
    value = local.maintainers
}

output "members" {
    value = local.members
}

output "uniq_members" {
    value = local.uniq_members
}

output "uniq_repos" {
    value = local.uniq_repos
}

output "admin_repos" {
    value = local.admin_repos
}

output "write_repos" {
    value = local.write_repos
}

output "maintain_repos" {
    value = local.maintain_repos
}

output "triage_repos" {
    value = local.triage_repos
}
