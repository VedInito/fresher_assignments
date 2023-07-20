#!/bin/zsh

WEB_SERVER_LOG_FILE=${1:-web-server.log}

Error_Codes=($(awk -F'"' '{ print $3 }' $WEB_SERVER_LOG_FILE | awk -F' ' '{ print $1 }'))

declare -A Error_Code_Counts

for Error_Code in ${Error_Codes[@]}
do
  if [[ -v Error_Code_Counts[$Error_Code] ]]
  then
    ((Error_Code_Counts[$Error_Code]++))
  else
    Error_Code_Counts[$Error_Code]=1
  fi
done

for Error_Code in ${(k)Error_Code_Counts}
do
  echo "Count of Error Code $Error_Code: ${Error_Code_Counts[$Error_Code]}"
done

