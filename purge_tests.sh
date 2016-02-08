#!/bin/bash
echo "This script will remove the entire pharser directory. This means that you will lose everything. If you want to preserve your last test results, save them before excuting this script"
read -p "Press [ENTER] if you want to delete the pharser directory or [CTRL+C] to abort this script."
cd /root
rm -r pharser
