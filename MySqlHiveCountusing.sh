#!/bin/bash

declare -a Database=tpcds

declare -a TableName=$(awk 'NR>1' /home/hdp/input.csv)

declare -a Path=/home/hdp/output.csv

for j in ${TableName[@]}
do
          sqlcount=$(mysql -h "relational.fit.cvut.cz" -u "guest" "-prelational" ${Database} -e "select count(*) from ${Database}.${j}" -s)

          hive -e "ANALYZE TABLE ${Database}.${j} COMPUTE STATISTICS"
   
          hivecount=$(hive -e "select count(*) from ${Database}.${j}")

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




