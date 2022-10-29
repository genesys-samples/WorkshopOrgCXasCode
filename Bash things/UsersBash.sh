#!/bin/bash

FILE="users.tf"

if [[ -f "$FILE" ]]; then 
rm users.tf
fi

for (( c=1; c<=80; c++ ))
do
    echo -e "resource \"genesyscloud_user\" \"Workshop_user$c\" {\n\temail    = \"workshopuser$c@genesystest.com\"\n\tname     = \"Workshop User $c\"\n\tpassword = var.password\n\tstate    = \"active\"\n\trouting_skills {\n\tskill_id = data.genesyscloud_routing_skill.z$c.id\n\tproficiency = 4.5\n\t}\n\t}" >> $FILE
done