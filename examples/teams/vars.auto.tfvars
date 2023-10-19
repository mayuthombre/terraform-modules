#Add new set of vaues to create a new team
team_var = {
    "Terraform test team 1" =  [      #this is the name of the team
        {
            username = "name1",       # member to be added
            role = "member"           # Role of the member, optional value. Default value is member
        },
        {
            username = "name2",
            role = "member"
        }
    ],
    "Terraform test team 2" =  [
        {
            username = "name1",
            role = "member"
        },
        {
            username = "name3",
            role = "member"
        }
    ],
    "Terraform test team 3" =  []
    "Terraform test team 4" =  [
        {
            username = "name4",
            role = "maintainer"
        },
        {
            username = "name3",
        }
    ],
    "Terraform test team 5" =  [
        {
            username = "name5",
        },
        {
            username = "name6",
            role = "member"
        }
    ],
}
