# Process Monitoring and Restarting

The script serves as a process itself and accepts the child process as arguments. The child process should not have any additional arguments since the script uses space as a delimiter.

This script is designed to monitor and automatically restart a given program if it crashes. It accepts the command for the child program as command-line arguments and does not suppress any output. The script operates in an infinite loop, continuously checking the specified processes and restarting them if they are not found.

To ensure that the script can be terminated, a sleep duration of 1 second has been added. When Ctrl+C is pressed, only the child process is closed and immediately restarted. To exit the script entirely, press Ctrl+C twice.

## Usage

1. Make the script executable: `chmod +x process_monitor.sh`
2. Execute the script, providing the command for the child program as arguments: `./process_monitor.sh program1 program2 program3`

## How It Works

- The script utilizes an infinite loop to monitor the specified processes.
- It checks the running status of each process using `pgrep -i`.
- If a process is not found, indicating a crash, the script promptly restarts the process.
- The script allows the child process to print output on stdout/stderr for monitoring and troubleshooting.

Please ensure that the provided commands are correct and executable. The script assumes that the child program terminates gracefully upon crashing.

