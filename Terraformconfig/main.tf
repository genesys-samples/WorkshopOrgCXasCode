terraform {
  required_version = "~> 1.3.1"
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
  name = "Terraform_user"
}



#Assigning the agents and user
resource "genesyscloud_user_roles" "test_01roles" {
  user_id = genesyscloud_user.test_user01.id
  roles {
    role_id = data.genesyscloud_auth_role.employee.id
  }

  roles {
    role_id = data.genesyscloud_auth_role.Developer.id
  }

roles {
    role_id = data.genesyscloud_auth_role.GenesysCloudVoiceAdmin.id
  }
  roles {
    role_id = data.genesyscloud_auth_role.MasterAdmin.id
  }
  roles {
    role_id = data.genesyscloud_auth_role.Terraform_user.id
  }


}
resource "genesyscloud_user" "test_user01" {
  email           = "workshopuser001@genesystest.com"
  name            = "Terraform user 010"
  password        = var.password
  state           = "active"
}
