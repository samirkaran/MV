#!/bin/bash -xe

sshpass -p welcome@123 ssh hdp@175.100.150.91 -o StrictHostKeyChecking=no 'bash -s' < /mnt/c/Users/Samir/.jenkins/workspace/MarketingVitalP1/MySqlHiveCountusing.sh
