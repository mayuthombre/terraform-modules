# Terraform Modules

This repository simplifies the management of GitHub team . You can create, modify or delete team, members, and repositories using this repository. <br>
Thus, allowing for flexible access control on your GitHub Organisation.

## Table of Contents

- [Getting Started](#getting-started)
- [Creating a new team](#creating-a-new-team)
- [JSON Configuration](#json-configuration)
- [Adding a member to the team](#adding-a-member-to-the-team)
- [Removing a user from the team](#removing-a-user-from-the-team)
- [Adding a repository to the team](#adding-a-repository-to-the-team)
- [Removing a repository from the team](#removing-a-repository-from-the-team)


<br>

## Getting Started

GitHub teams, memberships and repositories are managed using Terraform IaC.

Repository structure is like below ⬇️



```
📂organisation-team-config
 ┣ 📜.gitignore
 ┣ 📜main.tf
 ┣ 📜provider.tf
 ┣ 📜team_blue.json
 ┣ 📜team_red.json
 ┗ 📜variables.tf
 ```

### Terraform configuration files

You will find terraform configuration files in the root folder. 

Below is an example of `main.tf` 
<br>
In this file, there are 4 variables needed for a module to work:
1. `source` - This will download required terraform module from central location. This will be common for all modules.
2. `json_file` - Contains all the essential information to create and manage the team effectively
3. `owner_name` - Represents organisation name within which team will be created
4. `github_token` - Configured as repository secret
```
module "team_red" {
  source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=main"
  json_file    = "team_red.json"
  owner_name   = "<ORGANISATION_NAME>"
  github_token = var.github_token
}
```

Example of `variable.tf`

```
variable "github_token" {
  description = "Token used to apply configuration changes"
  type        = string
}
```

Example of `provider.tf` <br>
**Important information about backend:**  If you are running this solution on GitHub Actions, ensure that you have configured backend somehwere in cloud to presevet terraform state file. Otherwise, you will lost the statefile once the GitHub hosted runner finishes terraform apply 
```
terraform {
  backend "s3" {
    ## YOUR BACKEND CONFIG GOES HERE
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
```
<br>

## Creating a new team
To create a new team:
1. Clone this repository
2. Create a feature branch
3. Create a JSON file that will represent your team members, maintainers and repositories.
4. Add a new module by copying the below code block and replacing the values as mentioned 

```
module "<TEAM_NAME>" {
  source       = "git::https://github.com/mayuthombre/terraform-modules.git//modules/teams?ref=main"
  json_file    = "<YOUR_JSON_FILE>"
  owner_name   = "<ORGANISATION_NAME>"
  github_token = var.github_token
}
```
5. Commit your code changed and raise a PR for review
6. Track PR comment section for terraform plan. If there are any failures, please ensure to fix it before requesting review
7. Once reviewer approves the PR, terraform will do auto apply and your new team will be created in GitHub

## JSON Configuration


Code block below represents how you will need to create JSON file for this solution to work.


``` json
{
    "team_name": "Test team",     //(Mandatory) Name of the Team to be created 
    "description": "Test team",   //(Optional) Description of the team to be created 
    "maintainers": [              //(Optional) Users to be added to team with maintainer role 
      "user1",
      "user2"
    ],
    "members": [                  //(Optional) Users to be added to team with member role 
      "user3",
      "user4",
      "user5"
    ],
    "repos": {                    
      "admin": [                 //(Optional) List of repositories to be added to team with admin permissions 
        "repo1",
        "repo2"
      ],
      "maintain": [              //(Optional) List of repositories to be added to team with maintain permissions 
        "repo3",
        "repo4"
      ],
      "push": [                  //(Optional) List of repositories to be added to team with push/write permissions
        "repo5"
      ],
      "triage": []               //(Optional) List of repositories to be added to team with triage permissions
    }
}

```
<br>

## Adding a member to the team

To add new member or a maintainer to the team, please follow these steps:

1. Clone this repository
2. Create a feature branch
3. Open the JSON file that belongs to the the team where a member or maintainer needs to be added
4. Add the new user's UniKey in the appropriate field as shown below. 

```
{
    "team_name": "Your team name",     
    "description": "",   
    "maintainers": [              
      "old_maintainer1",
      "new_maintainer"
    ],
    "members": [                  
      "old_member1",
      "old_member2",
      "old_member3",
      "new_member",
    ],
}
```
5. Commit your code changed and raise a PR for review
6. Track PR comment section for terraform plan. If there are any failures, please ensure to fix it before requesting review
7. Once reviewer approves the PR, terraform will do auto apply and your username will be added to the respective team


## Removing a user from the team

To remove member or a maintainer from the team, please follow these steps:

1. Clone this repository
2. Create a feature branch
3. Open the JSON file that belongs to the the team from where a member or maintainer needs to be removed.
4. Remove the UniKey belonging to member / maintainer from JSON file
5. Commit your code changed and raise a PR for review
6. Track PR comment section for terraform plan. If there are any failures, please ensure to fix it before requesting review
7. Once reviewer approves the PR, terraform will do auto apply and remove user from the team

## Adding a repository to the team

To add new repository to the team, please follow these steps:

1. Clone this repository
2. Create a feature branch
3. Open the JSON file that belongs to the the team where a repository needs to be added
4. Based on the permission to be granted, please add the repository name in the appropriate field as shown below.

```
{
    "repos": {                    
      "admin": [                 
        "old_repo1",
        "old_repo2",
        "new_repo"
      ],
      "maintain": [              
        "old_repo3",
        "old_repo4"
      ],
      "push": [                  
        "old_repo5"
      ],
      "triage": []               
    }
}
```
5. Commit your code changed and raise a PR for review
6. Track PR comment section for terraform plan. If there are any failures, please ensure to fix it before requesting review
7. Once reviewer approves the PR, terraform will do auto apply and add repository to the team


## Removing a repository from the team

To remove repository from the team, please follow these steps:

1. Clone this repository
2. Create a feature branch
3. Open the JSON file that belongs to the the team from where a repository needs to be removed from.
4. Remove the repository name from JSON file
5. Commit your code changed and raise a PR for review
6. Track PR comment section for terraform plan. If there are any failures, please ensure to fix it before requesting review
7. Once reviewer approves the PR, terraform will do auto apply and remove repository from the team