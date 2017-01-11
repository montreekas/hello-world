#!/bin/sh

echo `ps -ef | grep PROCESS | grep -v grep | awk '{print $2}' | xargs kill -9` >> test.txt

#echo "$FREE"

