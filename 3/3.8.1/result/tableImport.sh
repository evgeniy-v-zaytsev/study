#!/bin/bash
tableName=$1
dbName=$2

echo "Table name is $tableName; database name is $dbName"

logFile=$tableName"_stdout.log"
errFile=$tableName"_stderr.log"

[ -f $logFile ] && rm $logFile
[ -f $errFile ] && rm $errFile

hdfs dfs -rm -r -f -skipTrash $tableName >$logFile 2>$errFile

export JAVA_HOME="/usr"
/usr/lib/sqoop/bin/sqoop import --connect "jdbc:mysql://10.93.1.9/skillfactory" \
        --username mysql \
        --password arenadata \
        --hive-import -m 1 \
        --table $tableName \
        --hive-table ${dbName}.$tableName >$logFile 2>$errFile

echo "Done copy of table: "$tableName
		