#!/bin/bash

LOG_FILE="access.log"

if [[ ! -f "$LOG_FILE" ]]; then
  echo "File log tidak ditemukan: $LOG_FILE"
  exit 1
fi

echo ""
echo "Top 5 IP addresses dengan request terbanyak:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "Top 5 path yang paling sering diakses:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "Top 5 status code yang paling sering muncul:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "Top 5 User-Agent terbanyak:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

