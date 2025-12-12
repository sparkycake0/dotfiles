#!/bin/sh
# Extract just the short CPU model name, for example:
# "AMD Ryzen 3 4300G" → "Ryzen 3"
# This is a simple example, you can customize the parsing.

cpu_full=$(lscpu | grep "Model name" | cut -d: -f2- | sed 's/^ *//')
# Example simple extraction: get "Ryzen 3" by extracting first 2 words after "AMD"
cpu_short=$(echo "$cpu_full" | grep -oP '(Ryzen\s\d)')

if [ -z "$cpu_short" ]; then
  # fallback to full name if extraction fails
  echo "$cpu_full"
else
  echo "$cpu_short"
fi
