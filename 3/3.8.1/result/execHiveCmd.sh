#!/bin/bash
sqlInput=$1

logFile="exec_stdout.log"
errFile="exec_stderr.log"
[ -f $logFile ] && rm $logFile
[ -f $errFile ] && rm $errFile

sqlCmd="!connect  jdbc:hive2://10.93.1.9:10000 hive eee;
"$sqlInput";"

echo $sqlCmd

result=$(beeline -f $sqlCmd) >$logFile 2>$errFile
if [ ! $? -eq 0 ]; then 
	echo "There were errors while working with dir, check "$errFile
else
	echo $result
fi