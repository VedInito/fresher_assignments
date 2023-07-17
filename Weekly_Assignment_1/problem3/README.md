# Problem 3 - Password Strength Evaluation

This directory contains a script that evaluates the strength of a user-provided password based on specific criteria. The password's strength is determined by considering its length and the inclusion of uppercase letters, lowercase letters, and special characters.

## Approach to checking password strength
It was difficult to check for common passwords like "5!mpleP@55w0rd". It satisfys the criteria but week. Therefore, I adopted approach to evaluate the password's strength against brute force attack. The script assesses the mixture of characters and the length of the password.

PASSWORD_STRENGTH is determined by the formula SIZE ^ PASSWORD_LENGTH, where SIZE represents the number of characters available and PASSWORD_LENGTH represents the length of the password. This value is known as PASSWORD_STRENGTH. SIZE is different for different passwords.

Based on predefined benchmarks for strong, hard, medium, and low passwords, the script assesses the strength of the provided password accordingly.

Please refer to the script for the actual implementation and further details.

