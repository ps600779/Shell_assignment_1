#!/bin/bash

input_file="quotes.txt"

grep -v '^\s*$' "$input_file" > quotes_empty.txt

sort quotes_empty.txt | uniq > quotes_rdup.txt

awk -F '-' '{personality[$2]++} END {for (p in personality) print p ": " personality[p]}' quotes_rdup.txt > quotes_byperson.txt

grep -oE '\bs[^a ]*' quotes_rdup.txt | sort | uniq

echo "Tasks completed successfully!"