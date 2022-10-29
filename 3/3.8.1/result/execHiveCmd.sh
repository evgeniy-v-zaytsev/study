#!/bin/bash
sqlInput=$1

logFile="exec_stdout.log"
errFile="exec_stderr.log"
execFile="/tmp/zaytsevev/sql.txt"
[ -f $logFile ] && rm $logFile
[ -f $errFile ] && rm $errFile
[ -f $execFile ] && rm $execFile

sqlCmd="!connect jdbc:hive2://10.93.1.9:10000 hive eee;
"$sqlInput";"

echo $sqlCmd >$execFile

result=$(beeline -f $execFile) >$logFile 2>$errFile
r=$?
if [ ! $r -eq 0 ]; then 
	echo "There were errors while working with dir, check $errFile"
else
	echo $result
fi