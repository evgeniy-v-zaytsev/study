#!/bin/bash
tableName=$1
hdfsDir=$2
hdfsName=$3

logFile=$tableName"_copyToHdfs_stdout.log"
errFile=$tableName"_copyToHdfs_stderr.log"

[ -f $logFile ] && rm $logFile
[ -f $errFile ] && rm $errFile


if [[ -z "$hdfsName" ]] 
then 
	echo "Copying "$fileName" into HDFS..." 
	hdfs dfs -mkdir -p $hdfsDir >$logFile 2>$errFile
else 
	echo "Deleting "$hdfsDir " from HDFS..." 
	hdfs dfs -rm -r -f -skipTrash $hdfsDir
fi
result=$?
if [[ ! $result -eq 0 ]]; then 
	echo "There were errors while working with dir, check "$errFile
else if [ -z "$hdfsName" ]	; then
	echo "Done"
else 
	hdfs dfs -put -f $fileName,$hdfsDir"/"$hdfsName >$logFile 2>$errFile
	result=$?
	[ ! $result -eq 0 ] && echo "There were errors while copying file, check "$errFile
fi