#!/bin/bash

log_file="test.log"
bot_token="TOKEN"
chat_id="ID"

send_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" \
        -d "chat_id=${chat_id}" \
        -d "text=${message}" > /dev/null
}

# if lines are added to a log file, then call POST-request
# lines are added using a script.sh
tail -n 0 -F "$log_file" | while read line
do
    send_message "$line"
done
