
#!/bin/bash

declare -a Database=test

declare -a TableName=$(awk 'NR>1' /home/sakha-t4502/input.csv)

declare -a Path=/home/sakha-t4502/output.csv

for j in ${TableName[@]}
do
          sqlcount=$(mysql -u root -proot test -e "select count(*) from ${Database}.${j}" -s)
   
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


