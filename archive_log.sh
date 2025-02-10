#!/bin/bash
# Create a shell script to archive the log file heart_rate_log.txt.

# Variable declaration
LOG_FILE="heart_rate_log.txt"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
ARCHIVED_LOG_FILE="heart_rate_log_${TIMESTAMP}"

# Rename the log file with a timestamp
mv "$LOG_FILE" "$ARCHIVED_LOG_FILE"

# Confirm the archiving process
echo "Log file archived as $archived_log_file"

