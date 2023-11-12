#!/bin/zsh

if [ $# -ne 1 ]; then
  echo "Usage: $0 <number_of_random_words>"
  exit 1
fi

# Number of random words to extract
num_random_words=$1

# Make the curl request and save it to a temporary file
temp_file=$(mktemp)
curl -s 'https://raw.githubusercontent.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/en' > "$temp_file"

# Count the number of lines in the file
line_count=$(wc -l < "$temp_file")

# Generate and extract the specified number of random words
for ((i = 1; i <= num_random_words; i++)); do
  # Generate a random line number within the range of lines
  random_line_number=$((1 + RANDOM % line_count))
  
  # Extract the random line
  random_line=$(sed -n "${random_line_number}p" "$temp_file")
  
  # Print the random line
  echo "$random_line"
done

# Clean up the temporary file
rm "$temp_file"

