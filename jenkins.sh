#!/bin/bash -xe

sshpass -p welcome@123 ssh -tt hdp@175.100.150.91 -p 22 'bash -s' < /var/lib/jenkins/workspace/MarketingVitals/MySqlHiveCountusing.sh
