#!/bin/bash
# Create a shell script to archive the log file heart_rate_log.txt.
#variable declaration
 LOG_FILE="heart_rate_log.txt"
 TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
 ARCHIVED_LOG_FILE="${LOG_FILE}-${TIMESTAMP}"
#rename log file with timestamp
 mv "${LOG_FILE}-${ARCHIVED_LOG_FILE}
# confirm the archiving process
echo "log file archived as "ARCHIVED_LOG_FILE"

