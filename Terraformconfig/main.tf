terraform {
  required_version = "~> 1.1.8"
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

data "genesyscloud_auth_role" "AgentAssist" {
  name = "Agent Assist"
}
data "genesyscloud_auth_role" "admin" {
  name = "admin"
}

