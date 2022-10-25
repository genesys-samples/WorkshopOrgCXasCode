terraform {
  required_version = "~> 1.2.8"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
      version = "~> 1.0.0"
    }
  }
}

provider "genesyscloud" {
  oauthclient_id = var.oauthclient_id
  oauthclient_secret = var.oauthclient_secret
  aws_region = var.aws_region
}
data "genesyscloud_auth_role" "employee" {
  name = "employee"
}

data "genesyscloud_auth_role" "Developer" {
  name = "Developer"
}

data "genesyscloud_auth_role" "GenesysCloudVoiceAdmin" {
  name = "Genesys Cloud Voice Admin"
}
data "genesyscloud_auth_role" "MasterAdmin" {
  name = "Master Admin"
}
data "genesyscloud_auth_role" "Terraform_user" {
  name = "Terraform user"
}



#Assigning the agents and user
resource "genesyscloud_user_roles" "sheldoncooper_roles" {
  user_id = genesyscloud_user.sheldoncooper_agent.id
  roles {
    role_id = data.genesyscloud_auth_role.employee.id
  }

  roles {
    role_id = data.genesyscloud_auth_role.user.id
  }
}
resource "genesyscloud_routing_skill" "test_skill" {
  name = "CX as Code Skill "
}
resource "genesyscloud_user" "test_user" {
  email           = "workshopuser00@genesystest.com"
  name            = "Terraform user"
  password        = var.password
  state           = "inactive"
  acd_auto_answer = true
  division_id     = data.genesyscloud_auth_division.terraform.id
  routing_skills {
    skill_id    = genesyscloud_routing_skill.test_skill.id
    proficiency = 4.5
  }

  routing_utilization {
    call {
      maximum_capacity = 1
      include_non_acd  = true
    }
    callback {
      maximum_capacity          = 2
      include_non_acd           = false
      interruptible_media_types = ["call", "email"]
    }
    chat {
      maximum_capacity          = 3
      include_non_acd           = false
      interruptible_media_types = ["call"]
    }
    email {
      maximum_capacity          = 2
      include_non_acd           = false
      interruptible_media_types = ["call", "chat"]
    }
    video {
      maximum_capacity          = 1
      include_non_acd           = false
      interruptible_media_types = ["call"]
    }
    message {
      maximum_capacity          = 4
      include_non_acd           = false
      interruptible_media_types = ["call", "chat"]
    }
  }
}
data "genesyscloud_auth_division" "terraform" {
  name = "home"
}
