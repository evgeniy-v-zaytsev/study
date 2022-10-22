#!/bin/bash

sqlFile=$1
# проверить, содержит ли файл !connect
firstRow=$(cat $sqlFile | head -1)
if [[ $firstRow -eq "!connect" ]] 
then
    result=$(beeline -f $sqlFile)
    echo $result
else
    echo "First row of file "$sqlFile" doesn`t contains !connect"
fi