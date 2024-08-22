#!/bin/bash

generate_password() {
    export LC_ALL=C
    
    local length=$((RANDOM % 3 + 8))
    local special_chars="%&#$@()!"
    local password=""
    
    password+=$(head /dev/urandom | tr -dc 'A-Z' | head -c 1)
    password+=$(head /dev/urandom | tr -dc 'a-z' | head -c 1)
    password+=$(head /dev/urandom | tr -dc "$special_chars" | head -c 1)
    
    password+=$(head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c $((length - 3)))

    password=$(echo "$password" | awk -v len=${#password} 'BEGIN{srand();} {for (i=1; i<=len; i++) { j=int(rand()*len) + 1; temp=substr($0, j, 1); printf("%s", substr($0, i, 1)); gsub(substr($0, i, 1), temp, $0); }}')

    echo "$password"
}

generate_password
