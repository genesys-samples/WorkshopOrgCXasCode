#!/bin/bash

FILE="skills.tf"

if [[ -f "$FILE" ]]; then 
rm skills.tf
fi

for (( c=01; c<=80; c++ ))
do
    echo -e "data \"genesyscloud_routing_skill\" \"z$c\"{\n\tname = \"z$c\"\n\t}" >> $FILE
done