#!/bin/bash

FILE="queues.tf"

if [[ -f "$FILE" ]]; then 
rm queues.tf
fi

for (( c=1; c<=80; c++ ))
do
    echo -e "members {\n\tuser_id = genesyscloud_user.Workshop_user$c.id\n\t}\n\t" >> $FILE
done