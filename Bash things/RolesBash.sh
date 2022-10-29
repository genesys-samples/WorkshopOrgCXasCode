#!/bin/bash

FILE="roles.tf"

if [[ -f "$FILE" ]]; then 
rm roles.tf
fi

for (( c=1; c<=80; c++ ))
do
    echo -e "resource \"genesyscloud_user_roles\" \"Workshoproles_user$c\" {\n\tuser_id    = genesyscloud_user.Workshop_user$c.id\n\troles {\n\trole_id     = data.genesyscloud_auth_role.employee.id\n\t}\n\troles {\n\trole_id     = data.genesyscloud_auth_role.Developer.id\n\t}\n\troles {\n\trole_id     = data.genesyscloud_auth_role.GenesysCloudVoiceAdmin.id\n\t}\n\troles {\n\trole_id     = data.genesyscloud_auth_role.MasterAdmin.id\n\t}\n\troles {\n\trole_id     = data.genesyscloud_auth_role.Terraform_user.id\n\t}\n\troles {\n\trole_id     = data.genesyscloud_auth_role.AgentAssist.id\n\t}\n\t}" >> $FILE
done