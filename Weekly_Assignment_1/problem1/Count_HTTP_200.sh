#!/bin/zsh

WEB_SERVER_LOG_FILE=${1:-web-server.log}
grep  'HTTP\/1\.1\"\ 200' $WEB_SERVER_LOG_FILE | wc -l
