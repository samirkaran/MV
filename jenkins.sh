#!/bin/bash -xe

sshpass -p welcome@123 ssh hdp@175.100.150.91 -p 22 'bash -s' < $JENKINS_HOME/workspace/MarketingVitalP1
sh MySqlHiveCountusing
