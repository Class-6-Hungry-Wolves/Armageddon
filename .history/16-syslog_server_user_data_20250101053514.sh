#!/bin/bash

set -e

# Send the log output from this script to user-data.log, syslog, and the console
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# We use the ncat utility from the nmap package as a TCP server
sudo apt-get update
sudo apt-get install -yq nmap

nohup ncat --listen 10. "${port}" --output /var/log/ncat-session.log &

# This echo signals that the user data script was successfully executed.
echo "--- READY ---"