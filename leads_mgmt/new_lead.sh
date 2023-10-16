#!//bin/bash

read -p "Enter First Name: " first_name

markdown_template="---
first_name: $first_name
author: $author
---
"

output_file="leads.md"

echo -e "$markdown_template" >> "$output_file"

echo "New lead added to $output_file"