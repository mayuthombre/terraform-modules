terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  # Configuration options
  owner = "furo-migrations-emu"
  token = var.github_token
}
