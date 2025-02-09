#!/usr/bin/env bash

# Function to simulate the heart rate
generate_heart_rate() {
  # Generate a random heart rate between 60 and 100
  echo $(( RANDOM % 41 + 60 ))
}

# Prompt for device name
echo "Enter the device name (e.g., Monitor_A, Monitor_B): "
read DEVICE_NAME

# Check if device name is provided
if [ -z "$DEVICE_NAME" ]; then
  echo "Device name is required!"
  exit 1
fi

# Log file path
LOG_FILE="heart_rate_log.txt"

# Background logging process function
log_heart_rate() {
  while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    # Generate simulated heart rate from HEART_RATE function
    HEART_RATE=$(generate_heart_rate)
    
    # Write to log file with timestamp, device name, and heart rate format
    echo "$TIMESTAMP $DEVICE_NAME $HEART_RATE" >> $LOG_FILE
    
    sleep 1
  done
}

log_heart_rate &

PID=$!

echo "Heart rate logging started in the background with PID: $PID"
