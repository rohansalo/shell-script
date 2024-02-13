#!/bin/bash

# Check if a file is provided as an argument
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File not found: $filename"
    exit 1
fi

# Use tr to convert to lowercase, sed to remove punctuation, and tr again to split into words
# Then use sort and uniq to count word frequencies
word_list=$(tr '[:upper:]' '[:lower:]' < "$filename" | sed 's/[^a-zA-Z ]//g' | tr -s ' ' '\n' | sort | uniq -c)

# Sort the word list by frequency in descending order
sorted_word_list=$(echo "$word_list" | sort -rn)

# Print the sorted word list
echo "Word Frequency"
echo "------------"
echo "$sorted_word_list"

exit 0
