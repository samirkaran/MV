#!/bin/bash -xe

Database=tpcds

TableName=$(awk 'NR>1' /var/lib/jenkins/workspace/MarketingVitals/input.csv)

Path=/var/lib/jenkins/workspace/MarketingVitals/output.csv

start-all.sh

for j in ${TableName}
do
          sqlcount=$(mysql -h "relational.fit.cvut.cz" -u "guest" "-prelational" ${Database} -e "select count(*) from ${Database}.${j}" -s)
   
          hivecount=$(hive -S -e "USE ${Database}; select count(*) from ${Database}.${j}")

          zz=$(printf '%s\n' ${sqlcount} ${hivecount} | paste -sd ',')

          yy=$(if [[ $sqlcount == $hivecount ]]; then
                   echo "True"
                 else 
                   echo "False"
                fi)

          vv=$(echo $(($sqlcount-$hivecount)) | sed 's/-//')

          printf '%s\n' ${j} $zz $yy $vv| paste -sd ',' >> ${Path}

done

sed -i '1 i \Table Name,Total Count in MySql,Total Count in Hive,Status,Difference in Count' ${Path}




