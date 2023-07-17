#!/bin/bash

declare -i Total_Time_Minutes=${1:-30}

declare -i Seconds_In_Minutes=60
declare -i Total_Time_Seconds=$((Total_Time_Minutes * Seconds_In_Minutes))

declare -i Number_Of_Partitions=$((RANDOM % Total_Time_Minutes))


s_For_Each_Second_Array=($(printf "%0.ss " $(seq 1 "$Total_Time_Seconds")))
P_For_Each_Partition=($(printf "%0.sP " $(seq 1 "$Number_Of_Partitions")))

Time_Partition_Array=("${s_For_Each_Second_Array[@]}" "${P_For_Each_Partition[@]}")

Suffled_Time_Partition_Array=($(shuf -e "${Time_Partition_Array[@]}"))
Suffled_Time_Partition_Array=("${Suffled_Time_Partition_Array[@]}" "P")

Suffled_Time_Part_String=$(printf "%s" "${Suffled_Time_Partition_Array[@]}" | tr -d ' ')

IFS="P" read -ra s_For_Each_Parted_Time_Second_Array <<< "$Suffled_Time_Part_String"

declare -a Partitioned_Time_Segments=()
for segment in "${s_For_Each_Parted_Time_Second_Array[@]}"; do
  Partitioned_Time_Segments+=(${#segment})
done

for Total_File_Time_Seconds in "${Partitioned_Time_Segments[@]}"; do
  File_Time_Minutes=$((Total_File_Time_Seconds / 60))
  File_Time_Seconds=$((Total_File_Time_Seconds % 60))

  File_Name=${File_Time_Minutes}_${File_Time_Seconds}.mp3

  echo "creating $File_Name"
  touch "./$FileName"
  touch "./$File_Name"
done

echo
