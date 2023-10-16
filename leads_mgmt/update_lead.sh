#!/bin/bash

read -p "Enter First Name: " first_name
read -p "Enter Last Name: " last_name

output_file="leads.md"

lead_name="$first_name | $last_name"

echo "Updating lead ${first_name} ${last_name}"

IFS=$'|'
read -ra parts <<< "$(grep "$lead_name" "$output_file")"
IFS=$' \t\n'

read -p "Update Company (${parts[3]}): " new_company
read -p "Update Job Title (${parts[4]}): " new_job_title
read -p "Update Email (${parts[6]}): " new_email
read -p "Forecast $ (${parts[9]}): " new_forecast

stage_choices=("Created" "Responded" "Meeting Complete" "Aligned" "Demo" "POC" "Negotiation" "Contract Complete" "Closed Won" "Closed Lost")

PS3="Select lead stage (enter the number): "
select choice in "${stage_choices[@]}"; do
  case "$choice" in
    "Created")
      stage=${choice}
      win_probability="0.01"
      break
      ;;
    "Responded")
      stage=${choice}
      win_probability="1.00"
      break
      ;;
    "Meeting Complete")
      stage=${choice}
      win_probability="5.00"
      break
      ;;
    "Aligned")
      stage=${choice}
      win_probability="10.00"
      break
      ;;
    "Demo")
      stage=${choice}
      win_probability="20.00"
      break
      ;;
    "POC")
      stage=${choice}
      win_probability="40.00"
      break
      ;;
    "Negotiation")
      stage=${choice}
      win_probability="60.00"
      break
      ;;
    "Contract Complete")
      stage=${choice}
      win_probability="80.00"
      break
      ;;
    "Closed Won")
      stage=${choice}
      win_probability="100.00"
      break
      ;;
    "Closed Lost")
      stage=${choice}
      win_probability="0.00"
      break
      ;;
    *)
      echo "Invalid stage. Please select a valid option."
      ;;
  esac
done

company="${new_company:-${parts[3]}}"
job_title="${new_job_title:-${parts[4]}}"
email="${new_email:-${parts[6]}}"
forecast="${new_forecast:-${parts[9]}}"
today=$(date '+%Y-%m-%d %H:%M:%S')

markdown="| $first_name | $last_name | $company | $job_title | ${parts[5]}| $email | $stage | $win_probability | $forecast | $today |"

sed -i "s/.*$lead_name.*/$markdown/g" "$output_file"

echo "Updated lead $first_name $last_name in $output_file"
