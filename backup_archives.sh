#!/bin/bash

# Variable declarations
ARCHIVE_DIR="archived_logs_group1"  # Replace '5' with your group number
REMOTE_HOST="14b671fc3e5f.7c3476c2.alu-cod.online"          # Replace with the sandbox host information
REMOTE_USER="14b671fc3e5f"          # Replace with the sandbox username
REMOTE_DIR="/home/"                 # Directory on the remote backup server

# Step 1: Ensure the archive directory exists
if [ ! -d "$ARCHIVE_DIR" ]; then
  mkdir -p "$ARCHIVE_DIR"
  echo "Created local archive directory: $ARCHIVE_DIR"
fi

# Step 2: Move archived log files to the archive directory
echo "Moving archived log files to $ARCHIVE_DIR..."
mv heart_rate_log_* "$ARCHIVE_DIR/" 2>/dev/null

# Verify if files were moved
if [ "$(ls -A $ARCHIVE_DIR 2>/dev/null)" ]; then
  echo "Archived log files successfully moved to $ARCHIVE_DIR."
else
  echo "No archived log files found to move."
  exit 1
fi

# Step 3: Back up the archive directory to the remote server using SCP
echo "Backing up $ARCHIVE_DIR to remote server ($REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR)..."
scp -r "$ARCHIVE_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Verify if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful! $ARCHIVE_DIR has been backed up to $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR."
else
  echo "Backup failed! Please check your SSH/SCP configuration."
  exit 2
fi
