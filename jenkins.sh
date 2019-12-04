#!/bin/bash -xe

alias p='cd C:\Users\Samir\.jenkins\workspace\MarketingVitalP1\'

sshpass -p welcome@123 ssh hdp@175.100.150.91 -o StrictHostKeyChecking=no 'bash -s' < C:\Users\Samir\.jenkins\workspace\MarketingVitalP1\MySqlHiveCountusing.sh
