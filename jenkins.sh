#!/bin/bash -xe

sshpass -p welcome@123 ssh hdp@175.100.150.91 -o StrictHostKeyChecking=no
cd "$JENKINS_HOME\workspace\MarketingVitalP1"
sh MySqlHiveCountusing.sh
