# Web Server Log Analysis

This shell script parses a web server log file and provides two functionalities:

1. Counting the number of HTTP 200 errors in the log file.
2. Generating a list of all HTTP response codes present in the log file and their respective counts.

## Usage

- To count HTTP 200 errors:
$ ./Count_HTTP_200.sh [log_file]

If `[log_file]` is not provided, it assumes the file is named `web-server.log` in the same directory.

- To generate a list of response codes and their counts:
$ ./Count_All_Log_Codes.sh [log_file]

If `[log_file]` is not provided, it assumes the file is named `web-server.log` in the same directory.
