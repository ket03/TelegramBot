#!/bin/bash

log_file="/var/log/auth.log"

output_file="test.log"
# if test.log doesn't exist
touch "$output_file"

# inf loops. Monitoring log_file. If the line "Accepted" appears then add this line to test.log
tail -n 0 -F "$log_file" | while read line
do
    if echo "$line" | grep -qE 'Accepted'
    then
        echo "$line" >> "$output_file"
    fi
done
