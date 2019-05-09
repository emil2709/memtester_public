#!/bin/bash

arr=(
	8kb
	80kb
	800kb
	8mb
	80mb	
)

for x in {1..1440}
do
	for i in "${arr[@]}";
	do
		/usr/bin/time -p sh -c 'taskset -c 0 '$i'/a.out & taskset -c 0 '$i'/b.out'  |& awk 'FNR == 1{print $2}' >> memtester.txt &
		echo "$i" >> memtester.txt
		echo "$1" >> memtester.txt
		date +%T >> memtester.txt
		sleep 60
	done
done
