#!/bin/bash -xe

cd "$JENKINS_HOME\workspace\MarketingVitalP1"

sshpass -p welcome@123 ssh hdp@175.100.150.91 -o StrictHostKeyChecking=no 'bash -s' < $JENKINS_HOME\workspace\MarketingVitalP1\MySqlHiveCountusing.sh
